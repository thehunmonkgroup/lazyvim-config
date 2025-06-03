-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local util = require("util")

-------------------------------------------------
-- Disable modelines for Taskwarrior data files.
-------------------------------------------------
vim.api.nvim_create_autocmd({"BufEnter", "BufReadPost"}, {
  pattern = "*.task",
  callback = function()
    vim.o.modelines = 0
  end,
})

-------------------------------------------------
-- Set votl filetype for .otl files.
-------------------------------------------------
vim.api.nvim_create_autocmd({"BufEnter", "BufReadPost"}, {
  pattern = "*.otl",
  callback = function()
    vim.bo.filetype = "votl"
  end,
})

----------------------------------------------------
-- Close all buffers except the currently open one.
----------------------------------------------------
function _G.delete_hidden_buffers(force)
  local buffers = vim.api.nvim_list_bufs()
  for _, buffer in ipairs(buffers) do
    if vim.fn.buflisted(buffer) and vim.fn.bufwinnr(buffer) == -1 then
      if not force then
        vim.api.nvim_command("bwipeout " .. buffer)
      else
        vim.api.nvim_command("bwipeout! " .. buffer)
      end
    end
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.bo.autoindent = true
    vim.bo.smartindent = true
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("DirChanged", {
  group = vim.api.nvim_create_augroup("BasedpyrightAutoRestart", { clear = true }),
  callback = function()
    local clients = vim.lsp.get_clients({ name = "basedpyright" })
    if #clients > 0 then
      local python_path = util.get_python_path()
      if python_path ~= nil then
        vim.cmd({cmd = "PyrightSetPythonPath", args = {python_path}})
      end
    end
  end,
})
