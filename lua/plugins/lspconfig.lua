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
    return opts
  end,
}

