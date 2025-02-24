local util = require("util")

local function set_up_python_config()
  local python = {}
  local venv_name = util.get_active_pyenv_env()
  if venv_name then
    python.pythonPath = string.format("/home/hunmonk/.pyenv/versions/%s/bin/python", venv_name)
  end
  return python
end

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
            python = set_up_python_config(),
          },
        },
      },
    },
  },
}
