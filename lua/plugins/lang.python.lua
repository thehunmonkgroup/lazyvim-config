return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            python = {
                analysis = {
                    diagnosticSeverityOverrides = {
                        reportGeneralTypeIssues = "warning",
                    },
                    typeCheckingMode = "off",
                },
            },
            basedpyright = {
                disableOrganizeImports = true,
            },
          },
        },
      },
    },
  },
}
