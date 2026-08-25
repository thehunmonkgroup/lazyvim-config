return {
  "nvim-treesitter/nvim-treesitter",

  init = function()
    -- nvim-treesitter main uses `tree-sitter build`, which uses Rust cc-rs.
    -- cc-rs reads compiler choice from process env, not from old
    -- nvim-treesitter.install compiler lists.
    --
    -- This must be set before TS.install().
    if not os.getenv("IS_COLOSSUS") and vim.fn.executable("clang") == 1 then
      vim.env.CC = "clang"
      vim.env.CFLAGS = "-O0 -fPIC -std=c11"
    end
  end,

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

    -- Preserve LazyVim's setup and FileType hooks while limiting parser build
    -- concurrency on smaller machines. Both methods accept max_jobs as part
    -- of nvim-treesitter's public install options.
    if not os.getenv("IS_COLOSSUS") then
      local TS = require("nvim-treesitter")
      if not TS._serial_parser_installs then
        local install = TS.install
        local update = TS.update

        TS.install = function(languages, options)
          options = vim.tbl_extend("keep", options or {}, { max_jobs = 1 })
          return install(languages, options)
        end

        TS.update = function(languages, options)
          options = vim.tbl_extend("keep", options or {}, { max_jobs = 1 })
          return update(languages, options)
        end

        TS._serial_parser_installs = true
      end
    end

    return opts
  end,
}
