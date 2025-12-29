local util = require("util")

local function merge_server_customizations(servers)
  local python_path = util.get_python_path()
  if python_path then
    local server_customizations = {
      basedpyright = {
        on_attach = function(_client, _bufnr)
          -- Disable inlay hints by default.
          vim.lsp.inlay_hint.enable(false)
        end,
        settings = {
          python = {
            pythonPath = python_path,
          },
        },
      },
    }
    servers = vim.tbl_deep_extend("force", servers or {}, server_customizations)
    local auto_install_servers = {
      bashls = {
      },
    }
    servers = vim.tbl_deep_extend("force", servers or {}, auto_install_servers)
  end
  return servers
end

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local custom_opts = {
      virtual_text = false,
      float = {
        border = "rounded",
        source = "always",
      },
    }
    opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics or {}, custom_opts)
    opts.servers = merge_server_customizations(opts.servers)
    return opts
  end,
}
