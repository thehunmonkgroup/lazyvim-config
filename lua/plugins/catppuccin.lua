return {
  {
    "catppuccin/nvim",
    name = "catppuccin",

    opts = function(_, opts)
      opts.flavour = "mocha"
      opts.term_colors = true

      -- Keep floating windows opaque and their rounded borders visible across
      -- terminals, and gently de-emphasize inactive splits.
      opts.float = vim.tbl_deep_extend("force", opts.float or {}, {
        transparent = false,
        solid = false,
      })
      opts.dim_inactive = vim.tbl_deep_extend("force", opts.dim_inactive or {}, {
        enabled = true,
        shade = "dark",
        percentage = 0.1,
      })

      opts.highlight_overrides = opts.highlight_overrides or {}

      opts.highlight_overrides.mocha = function(C)
        local color_utils = require("catppuccin.utils.colors")
        local heading_colors = {
          C.blue,
          C.pink,
          C.lavender,
          C.green,
          C.peach,
          C.flamingo,
        }

        local highlights = {
          --------------------------------------------------------------------
          -- Markdown headings
          --
          -- Tree-sitter groups are added below alongside render-markdown's
          -- foreground and background groups so both layers share a palette.
          --------------------------------------------------------------------

          --------------------------------------------------------------------
          -- Emphasis
          --------------------------------------------------------------------

          -- Strong should pop, but not look like another heading.
          ["@markup.strong.markdown_inline"] = {
            fg = C.maroon,
            style = { "bold" },
          },

          -- Rosewater is subtle enough for prose emphasis.
          ["@markup.italic.markdown_inline"] = {
            fg = C.rosewater,
            style = { "italic" },
          },

          ["@markup.strikethrough.markdown_inline"] = {
            fg = C.overlay1,
            style = { "strikethrough" },
          },

          --------------------------------------------------------------------
          -- Inline code / code blocks
          --------------------------------------------------------------------

          -- Inline code gets a real "code pill" appearance.
          ["@markup.raw.markdown_inline"] = {
            fg = C.green,
            bg = C.surface0,
          },

          -- Don't force a foreground over injected language highlighting in
          -- fenced code blocks. A subtle background is enough.
          ["@markup.raw.block.markdown"] = {
            bg = C.mantle,
          },

          -- These are the extmark groups used while render-markdown is
          -- active. Keep them in lockstep with the captures above.
          RenderMarkdownCode = {
            bg = C.mantle,
          },
          RenderMarkdownCodeInline = {
            fg = C.green,
            bg = C.surface0,
          },
          RenderMarkdownCodeInfo = {
            fg = C.yellow,
            style = { "italic" },
          },

          --------------------------------------------------------------------
          -- Links
          --------------------------------------------------------------------

          -- Human-readable portion of [the link](...)
          ["@markup.link.label.markdown_inline"] = {
            fg = C.sapphire,
            style = { "bold" },
          },

          -- Actual URL. Catppuccin itself uses rosewater + italic + underline.
          ["@markup.link.url.markdown_inline"] = {
            fg = C.rosewater,
            style = { "italic", "underline" },
          },

          -- Reference-style link definitions are parsed by markdown rather
          -- than markdown_inline.
          ["@markup.link.label.markdown"] = {
            fg = C.sapphire,
            style = { "bold" },
          },
          ["@markup.link.url.markdown"] = {
            fg = C.rosewater,
            style = { "italic", "underline" },
          },

          RenderMarkdownLink = {
            fg = C.sapphire,
            style = { "bold" },
          },

          --------------------------------------------------------------------
          -- Lists / tasks
          --------------------------------------------------------------------

          ["@markup.list.markdown"] = {
            fg = C.mauve,
            style = { "bold" },
          },

          ["@markup.list.checked.markdown"] = {
            fg = C.green,
            style = { "bold" },
          },

          ["@markup.list.unchecked.markdown"] = {
            fg = C.overlay1,
          },

          RenderMarkdownBullet = {
            fg = C.mauve,
            style = { "bold" },
          },
          RenderMarkdownChecked = {
            fg = C.green,
            style = { "bold" },
          },
          RenderMarkdownUnchecked = {
            fg = C.overlay1,
          },

          --------------------------------------------------------------------
          -- Block quotes
          --------------------------------------------------------------------

          -- Intentionally subdued. Quotes should read like secondary prose,
          -- not compete with headings.
          ["@markup.quote.markdown"] = {
            fg = C.subtext0,
            style = { "italic" },
          },

          RenderMarkdownQuote = {
            fg = C.subtext0,
            style = { "italic" },
          },

          --------------------------------------------------------------------
          -- Markdown syntax punctuation
          --
          -- Make the Markdown itself recede while leaving the content vivid.
          --------------------------------------------------------------------

          ["@punctuation.special.markdown"] = {
            fg = C.overlay0,
          },

          ["@punctuation.delimiter.markdown"] = {
            fg = C.overlay0,
          },

          ["@punctuation.special.markdown_inline"] = {
            fg = C.overlay0,
          },

          ["@punctuation.delimiter.markdown_inline"] = {
            fg = C.overlay0,
          },

          --------------------------------------------------------------------
          -- Tables
          --------------------------------------------------------------------

          -- Table headers use @markup.heading rather than a numbered heading.
          ["@markup.heading.markdown"] = {
            fg = C.blue,
            style = { "bold" },
          },

          RenderMarkdownTableHead = {
            fg = C.blue,
            style = { "bold" },
          },
          RenderMarkdownTableRow = {
            fg = C.lavender,
          },

          --------------------------------------------------------------------
          -- Misc
          --------------------------------------------------------------------

          ["@label.markdown"] = {
            fg = C.yellow,
            style = { "italic" },
          },
        }

        for level, color in ipairs(heading_colors) do
          highlights[("@markup.heading.%d.markdown"):format(level)] = {
            fg = color,
            style = { "bold" },
          }
          highlights[("RenderMarkdownH%d"):format(level)] = {
            fg = color,
            style = { "bold" },
          }
          highlights[("RenderMarkdownH%dBg"):format(level)] = {
            bg = color_utils.darken(color, 0.12, C.base),
          }
        end

        return highlights
      end
    end,
  },
}
