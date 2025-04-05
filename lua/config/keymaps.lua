-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Global mappings (all modes)
map("", "<A-v>", '"+gP', { desc = "Paste to clipboard" })

-- Command-line mode
map("c", "<A-v>", "<C-R>+", { desc = "Paste to clipboard" })

-- Insert mode
map(
  "i",
  "<A-v>",
  "<C-G>u" .. vim.api.nvim_get_var("paste#paste_cmd")["i"],
  { desc = "Paste from clipboard", noremap = true }
)

-- Normal mode
map("n", "<leader>cab", ":call v:lua.delete_hidden_buffers()<CR>", { desc = "Close all other buffers" })
map("n", "<leader>cab!", ":call v:lua.delete_hidden_buffers(1)<CR>", { desc = "Close all other buffers!" })
map("n", "<leader>k", ":.w !/usr/local/bin/vim-line-to-task.sh<CR>", { desc = "Convert line to Taskwarrior task" })
map(
  "n",
  "<leader>F",
  function()
    require("neo-tree.command").execute({ action = "focus", source = "filesystem", dir = vim.fn.getcwd() })
  end,
  { noremap = true, silent = true, desc = "Force Neotree (cwd)" }
)


-- Visual mode
map("v", "<A-x>", '"+x', { desc = "Cut to clipboard", noremap = true })
map("v", "<A-S-x>", '"+x', { desc = "Cut to clipboard", noremap = true })
map("v", "<A-c>", '"+y', { desc = "Copy to clipboard", noremap = true })
map("v", "<A-v>", vim.api.nvim_get_var("paste#paste_cmd")["v"], { desc = "Paste from clipboard", noremap = true })
map("v", "<A-S-c>", '"+y', { desc = "Copy to clipboard", noremap = true })

-- Disabled mappings
vim.keymap.del({ "v" }, "<")
vim.keymap.del({ "v" }, ">")
