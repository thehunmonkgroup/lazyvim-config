return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "Avante" },
  opts = {
    file_types = { "markdown", "Avante" },
    code = {
      -- The plugin's code background uses a high-priority extmark that can
      -- cover Tree-sitter highlights from injected languages. The Markdown
      -- capture in catppuccin.lua still supplies a subtle background.
      disable_background = true,
    },
    pipe_table = {
      preset = "round",
      cell = "padded",
      style = "full",
    },
  },
}
