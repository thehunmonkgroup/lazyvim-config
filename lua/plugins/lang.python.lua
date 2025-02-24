return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                diagnosticSeverityOverrides = {
                  reportGeneralTypeIssues = "warning",
                  reportAny = "none",
                  reportExplicitAny = "none",
                  reportMissingTypeStubs = "none",
                  reportUnknownArgumentType = "none",
                  reportUnknownVariableType = "none",
                  reportUnknownMemberType = "none",
                  reportUnknownParameterType = "none",
                  reportUnusedCallResult = "none",
                },
              },
              disableOrganizeImports = true,
              disableTaggedHints = true,
            },
          },
        },
      },
    },
  },
}
