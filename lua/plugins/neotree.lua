return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = false,
    popup_border_style = "rounded",
    sort_case_insensitive = true,
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.number = true
        end,
      },
    },
    window = {
      mappings = {
        ["P"] = {
          "toggle_preview",
          config = {
            use_float = true,
          },
        },
      },
    },
  },
}
