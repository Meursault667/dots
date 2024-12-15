return {
  {
    "antonk52/markdowny.nvim",
    config = function()
      require("markdowny").setup()
    end,
    --
    --  <C-k>: Adds a link to visually selected text.
    --  <C-b>: Toggles visually selected text to bold.
    --  <C-i>: Toggles visually selected text to italic.
    --  <C-e>: Toggles visually selected text to inline code, and V-LINE selected text to a multiline code block.
    --
  },
  { "renerocksai/calendar-vim" },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
  {
    "3rd/image.nvim",
    --    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = true,
          download_remote_images = true,
          only_render_image_at_cursor = true,
        },
      },
      max_width_window_percentage = 80,
      editor_only_render_when_focused = true, -- auto show/hide images when the editor gains/looses focus
    },
  },
  {
    "3rd/diagram.nvim",
    dependencies = {
      "3rd/image.nvim",
    },
    opts = { -- you can just pass {}, defaults below
      renderer_options = {
        mermaid = {
          background = nil, -- nil | "transparent" | "white" | "#hex"
          theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
          scale = 3, -- nil | 1 (default) | 2  | 3 | ...
        },
      },
    },
  },
}
