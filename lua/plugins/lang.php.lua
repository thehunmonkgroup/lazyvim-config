return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              -- diagnostics = {
              --   undefinedTypes = false,
              --   undefinedFunctions = false,
              --   undefinedConstants = false,
              --   undefinedClassConstants = false,
              --   undefinedMethods = false,
              --   undefinedProperties = false,
              --   undefinedVariables = false,
              -- },
              environment = {
                includePaths = {
                  "/home/hunmonk/git/apartmentlines/apartmentlines.com",
                },
              },
              files = {
                associations = { "*.php", "*.module", "*.inc", "*.theme" },
              },
            },
          },
        },
      },
    },
  },
  -- Disable PHP linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = {},  -- Empty table to disable linters for PHP
      },
    },
  },
  -- Disable PHP formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = {},  -- Empty table to disable formatters for PHP
      },
    },
  },
}
