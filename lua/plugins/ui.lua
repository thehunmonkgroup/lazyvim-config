return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        -- The padded form renders the Powerline slants more reliably across
        -- terminals, particularly when glyph cell widths differ.
        separator_style = "padded_slant",
      })

      local highlights = type(opts.highlights) == "function" and opts.highlights() or opts.highlights or {}
      local C = require("catppuccin.palettes").get_palette("mocha")

      -- Catppuccin's stock separator uses crust against a crust tabline,
      -- which makes Powerline glyphs nearly disappear. Keep inactive tabs
      -- subdued while giving the active tab a clear Mocha accent.
      opts.highlights = vim.tbl_deep_extend("force", highlights, {
        separator = { fg = C.surface0, bg = C.mantle },
        separator_visible = { fg = C.blue, bg = C.mantle },
        separator_selected = { fg = C.mauve, bg = C.base },
        tab_separator = { fg = C.surface0, bg = C.mantle },
        tab_separator_selected = { fg = C.mauve, bg = C.base },
      })

      return opts
    end,
  },
}
