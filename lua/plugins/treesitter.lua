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

    local ts = require("nvim-treesitter")

    -- Determine whether a parser is already installed.
    -- We look for parser/<lang>.so in runtime paths.
    local function parser_installed(lang)
      local matches = vim.api.nvim_get_runtime_file(("parser/%s.so"):format(lang), true)
      return matches and #matches > 0
    end

    local function langs_to_install(langs)
      local todo = {}
      for _, lang in ipairs(langs) do
        if not parser_installed(lang) then
          table.insert(todo, lang)
        end
      end
      return todo
    end

    local function install_serial(langs)
      for _, lang in ipairs(langs) do
        local ok, handle = pcall(ts.install, { lang })
        if ok and handle and handle.wait then
          -- wait UP TO 10 minutes; returns as soon as it's done
          handle:wait(600000)
        end
      end
    end

    local function install_async(langs)
      for _, lang in ipairs(langs) do
        pcall(ts.install, { lang })
      end
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        local todo = langs_to_install(opts.ensure_installed)
        if #todo == 0 then
          return
        end

        if os.getenv("IS_COLOSSUS") then
          install_async(todo)
        else
          install_serial(todo)
        end
      end,
    })
  end,
}
