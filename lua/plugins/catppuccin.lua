return {
  {
    "catppuccin/nvim",
    name = "catppuccin",

    opts = function(_, opts)
      opts.flavour = "mocha"

      opts.highlight_overrides = opts.highlight_overrides or {}

      opts.highlight_overrides.mocha = function(C)
        return {
          --------------------------------------------------------------------
          -- Markdown headings
          --
          -- Rainbow hierarchy borrowed from a popular Catppuccin community
          -- configuration. Makes document structure immediately obvious.
          --------------------------------------------------------------------

          ["@markup.heading.1.markdown"] = {
            fg = C.blue,
            style = { "bold" },
          },
          ["@markup.heading.2.markdown"] = {
            fg = C.pink,
            style = { "bold" },
          },
          ["@markup.heading.3.markdown"] = {
            fg = C.lavender,
            style = { "bold" },
          },
          ["@markup.heading.4.markdown"] = {
            fg = C.green,
            style = { "bold" },
          },
          ["@markup.heading.5.markdown"] = {
            fg = C.peach,
            style = { "bold" },
          },
          ["@markup.heading.6.markdown"] = {
            fg = C.flamingo,
            style = { "bold" },
          },

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

          --------------------------------------------------------------------
          -- Block quotes
          --------------------------------------------------------------------

          -- Intentionally subdued. Quotes should read like secondary prose,
          -- not compete with headings.
          ["@markup.quote.markdown"] = {
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

          --------------------------------------------------------------------
          -- Misc
          --------------------------------------------------------------------

          ["@label.markdown"] = {
            fg = C.yellow,
            style = { "italic" },
          },
        }
      end
    end,
  },
}
