return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function(_, opts)
    vim.g.codeium_disable_bindings = 1
    vim.g.codeium_no_map_tab = true

    vim.keymap.set("i", "<A-h>", vim.fn["codeium#Complete"], { expr = true, desc = "Codeium: trigger completions" })
    vim.keymap.set("i", "<A-j>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, desc = "Codeium: previous" })
    vim.keymap.set("i", "<A-k>", vim.fn["codeium#Clear"], { expr = true, desc = "Codeium: clear" })
    vim.keymap.set("i", "<A-l>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, desc = "Codeium: next" })
    vim.keymap.set("i", "<A-;>", vim.fn["codeium#Accept"], { expr = true, desc = "Codeium: accept" })
    vim.keymap.set("n", "<A-i>", "<cmd>CodeiumAuto<CR>", { desc = "Codeium auto completions" })
    vim.keymap.set("n", "<A-o>", "<cmd>CodeiumManual<CR>", { desc = "Codeium manual completions" })
  end,
}
