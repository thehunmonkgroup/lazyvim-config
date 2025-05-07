return {
  {
    "williamboman/mason.nvim",
    version = "1.*",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash-language-server",
      })
    end,
  },
}
