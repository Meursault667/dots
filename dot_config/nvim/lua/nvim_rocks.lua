return {
  {
    "theHamsta/nvim_rocks",
    event = "VeryLazy",
    build = "pipx install hererocks && python3 -mhererocks . -l5.1 -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
    config = function()
      -- Add here the packages you want to make sure that they are installed

      local nvim_rocks = require("nvim_rocks") -- and these 2 lines for image magick support
      nvim_rocks.ensure_installed({ "magick" })
    end,
  },
}
