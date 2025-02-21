-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.spell = false
vim.opt.signcolumn = "auto"
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.undofile = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.background = "dark"

vim.g.autoformat = false
vim.g.lazyvim_php_lsp = "intelephense"
vim.g.lazyvim_python_lsp = "basedpyright"

------------------------------------------
-- Codium customizations.
------------------------------------------
local codeium_ignore_filetypes = {
  ["votl"] = false,
  ["markdown"] = false,
}
vim.g.codeium_filetypes = codeium_ignore_filetypes
vim.g.codeium_no_map_tab = true
vim.g.lazygit_config = {
  theme = {
    lightTheme = false,
    activeBorderColor = { "#89b4fa", "bold" },
    inactiveBorderColor = { "#a6adc8" },
    optionsTextColor = { "#89b4fa" },
    selectedLineBgColor = { "#313244" },
    cherryPickedCommitBgColor = { "#45475a" },
    cherryPickedCommitFgColor = { "#89b4fa" },
    unstagedChangesColor = { "#f38ba8" },
    defaultFgColor = { "#cdd6f4" },
    searchingActiveBorderColor = { "#f9e2af" },
  },
  authorColors = {
    ['*'] = '#b4befe',
  }
}
