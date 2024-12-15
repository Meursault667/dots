return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      ui = {
        enable = false,
      },
      -- more configuration options https://github.com/epwalsh/obsidian.nvim?tab=readme-ov-file#configuration-options
      workspaces = {
        {
          name = "docs",
          path = "~/01_docs/",
          overrides = {},
        },
      },
      {
        name = "no-vault",
        path = function()
          -- alternatively use the CWD:
          -- return assert(vim.fn.getcwd())
          return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
        end,
        overrides = {
          notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
          new_notes_location = "current_dir",
          templates = {
            folder = vim.NIL,
          },
          disable_frontmatter = false,
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "2_JOURNAL",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y",
        -- Optional, default tags to add to each new daily note created.
        default_tags = { "daily-notes" },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },
      disable_frontmatter = false,
      --     completion = {
      --       nvim_cmp = true,
      --       min_chars = 2,
      --     },
      -- => mkdwnflow Enter
      mappings = {
        --  -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        --  ["gf"] = {
        --    action = function()
        --      return require("obsidian").util.gf_passthrough()
        --    end,
        --    opts = { noremap = false, expr = true, buffer = true },
        --  },
        --  -- Toggle check-boxes.
        --["<leader>ch"] = {
        --  action = function()
        --    return require("obsidian").util.toggle_checkbox()
        --  end,
        --  opts = { buffer = true },
        --},
        --   -- Smart action depending on context, either follow link or toggle checkbox.
        --   ["<cr>"] = {
        --     action = function()
        --       return require("obsidian").util.smart_action()
        --     end,
        --     opts = { buffer = true, expr = true },
        --   },
      },

      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = "current_dir",
      -- Optional, customize how note IDs are generated given an optional title.
      -- ---@param title string|?
      -- ---@return string
      -- note_id_func = function(title)
      --   -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      --   -- In this case a note with the title 'My new note' will be given an ID that looks
      --   -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      --   local suffix = ""
      --   if title ~= nil then
      --     -- If title is given, transform it into valid file name.
      --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      --   else
      --     -- If title is nil, just add 4 random uppercase letters to the suffix.
      --     for _ = 1, 4 do
      --       suffix = suffix .. string.char(math.random(65, 90))
      --     end
      --   end
      --   return tostring(os.time()) .. "-" .. suffix
      -- end,
      -- -- Optional, customize how note file names are generated given the ID, target directory, and title.
      -- ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      -- ---@return string|obsidian.Path The full path to the new note.
      -- note_path_func = function(spec)
      --   -- This is equivalent to the default behavior.
      --   local path = spec.dir / tostring(spec.id)
      --   return path:with_suffix(".md")
      -- end,
      -- -- Either 'wiki' or 'markdown'.
      -- preferred_link_style = "wiki",
      --
      -- -- Optional, alternatively you can customize the frontmatter data.
      -- ---@return table
      -- note_frontmatter_func = function(note)
      --   -- Add the title of the note as an alias.
      --   if note.title then
      --     note:add_alias(note.title)
      --   end
      --
      --   local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      --
      --   -- `note.metadata` contains any manually added fields in the frontmatter.
      --   -- So here we just make sure those fields are kept in the frontmatter.
      --   if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      --     for k, v in pairs(note.metadata) do
      --       out[k] = v
      --     end
      --   end
      --
      --   return out
      -- end,
      -- Optional, for templates (see below).
      --    templates = {
      --      folder = "templates",
      --      date_format = "%Y-%m-%d",
      --      time_format = "%H:%M",
      --      -- A map for custom variables, the key should be the variable and the value a function
      --      substitutions = {},
      --    },

      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      ---@param url string
      follow_url_func = function(url)
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
        vim.ui.open(url) -- need Neovim 0.10.0+
      end,

      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
      -- file it will be ignored but you can customize this behavior here.
      ---@param img string
      follow_img_func = function(img)
        vim.fn.jobstart({ "xdg-open", url }) -- linux
      end,
      use_advanced_uri = true,
      --picker = {
      --  name = "telescope.nvim",
      --  note_mappings = {
      --    new = "<C-x>",
      --    insert_link = "<C-l>",
      --  },
      --  tag_mappings = {
      --    tag_note = "<C-x>",
      --    insert_tag = "<C-l>",
      --  },
      --},
      -- Optional, sort search results by "path", "modified", "accessed", or "created".
      sort_by = "modified",
      sort_reversed = true,

      -- Optional, determines how certain commands open notes. The valid options are:
      -- 1. "current" (the default) - to always open in the current window
      -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
      -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
      open_notes_in = "vsplit",
      -- Specify how to handle attachments.
      attachments = {
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this is a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per image by passing a full path to the command instead of just a filename.
        img_folder = "assets/imgs", -- This is the default

        -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
        ---@return string
        img_name_func = function()
          -- Prefix image names with timestamp.
          return string.format("%s-", os.time())
        end,

        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format("![%s](%s)", path.name, path)
        end,
      },
    },
  },
}
