return {
  {
    "jakewvincent/mkdnflow.nvim",
    opts = {
      foldtext = {
        title_transformer = function()
          local function my_title_transformer(text)
            local updated_title = text:gsub("%b{}", "")
            updated_title = updated_title:gsub("^%s*", "")
            updated_title = updated_title:gsub("%s*$", "")
            updated_title = updated_title:gsub("^######", "░░░░░▓")
            updated_title = updated_title:gsub("^#####", "░░░░▓▓")
            updated_title = updated_title:gsub("^####", "░░░▓▓▓")
            updated_title = updated_title:gsub("^###", "░░▓▓▓▓")
            updated_title = updated_title:gsub("^##", "░▓▓▓▓▓")
            updated_title = updated_title:gsub("^#", "▓▓▓▓▓▓")
            return updated_title
          end
          return my_title_transformer
        end,
        object_count_icon_set = "nerdfont", -- Use/fall back on the nerdfont icon set
        fill_chars = {
          left_edge = "╾─🖿 ─",
          right_edge = "──╼",
          item_separator = " · ",
          section_separator = " // ",
          left_inside = " ┝",
          right_inside = "┥ ",
          middle = "─",
        },
      },
      mappings = {
        --        MkdnEnter = false,
      },
    },
  },
}
