return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
      enable = false,
    })

    local parsers = {
      "bash",
      "c",
      "comment",
      "css",
      "dockerfile",
      "eex",
      "elixir",
      "erlang",
      "gitattributes",
      "gitcommit",
      "go",
      "hcl",
      "html",
      "http",
      "ini",
      "javascript",
      "jinja",
      "jq",
      "json",
      "json5",
      "jsonnet",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "perl",
      "php",
      "phpdoc",
      "properties",
      "python",
      "query",
      "rst",
      "ruby",
      "rust",
      "scss",
      "sql",
      "terraform",
      "toml",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    }

    -- Extend ensure_installed without duplicates
    opts.ensure_installed = opts.ensure_installed or {}
    local existing = {}
    for _, lang in ipairs(opts.ensure_installed) do
      existing[lang] = true
    end
    for _, lang in ipairs(parsers) do
      if not existing[lang] then
        table.insert(opts.ensure_installed, lang)
        existing[lang] = true
      end
    end

    return opts
  end,

  -- Override LazyVim’s treesitter config so non-Colossus installs are SERIAL.
  config = function(_, opts)
    local TS = require("nvim-treesitter")

    if not TS.get_installed then
      return vim.notify("Please update nvim-treesitter", vim.log.levels.ERROR)
    end
    if type(opts.ensure_installed) ~= "table" then
      return vim.notify("opts.ensure_installed must be a table", vim.log.levels.ERROR)
    end

    -- Prefer clang for parser compilation if available.
    -- This affects automatic TS.install() calls too.
    local ok_install, install = pcall(require, "nvim-treesitter.install")
    if ok_install and vim.fn.executable("clang") == 1 then
      install.compilers = { "clang", "cc", "gcc" }
    end

    TS.setup(opts)

    -- Compute missing parsers
    local installed = {}
    for _, lang in ipairs(TS.get_installed() or {}) do
      installed[lang] = true
    end

    local missing = {}
    for _, lang in ipairs(opts.ensure_installed or {}) do
      if not installed[lang] then
        table.insert(missing, lang)
      end
    end

    if #missing == 0 then
      return
    end

    if os.getenv("IS_COLOSSUS") then
      -- Parallel/async on Colossus.
      TS.install(missing, { summary = true })
    else
      -- Strict serial everywhere else.
      for _, lang in ipairs(missing) do
        local handle = TS.install({ lang }, { summary = true })
        if handle and handle.wait then
          local ok = handle:wait(300000) -- 5 minutes per parser
          if not ok then
            vim.notify("Timed out installing treesitter parser: " .. lang, vim.log.levels.WARN)
          end
        end
      end
    end
  end,
}
