return {
  {
    "frabjous/knap",
    config = function()
      local gknapsettings = {
        texoutputext = "pdf",
        textopdf = "latexmk -pdf %docroot%", -- other options: -lualatex -synctex=1
        textopdfviewerlaunch = "sioyek %outputfile%",
        textopdfviewerrefresh = "kill -HUP %pid%",
      }
      vim.g.knap_settings = gknapsettings
    end,
    keys = {
      {
        "<localleader>kp",
        function()
          require("knap").process_once()
        end,
        mode = { "n", "v", "i" },
        desc = "Knap: Process Once",
      },
      {
        "<localleader>kc",
        function()
          require("knap").close_viewer()
        end,
        mode = { "n", "v", "i" },
        desc = "Knap: Close Viewer",
      },
      {
        "<localleader>ka",
        function()
          require("knap").toggle_autopreviewing()
        end,
        mode = { "n", "v", "i" },
        desc = "Knap: Toggle Autopreviewing",
      },
      {
        "<localleader>kf",
        function()
          require("knap").forward_jump()
        end,
        mode = { "n", "v", "i" },
        desc = "Knap: SyncTeX Forward Search",
      },
    },
  },
}
