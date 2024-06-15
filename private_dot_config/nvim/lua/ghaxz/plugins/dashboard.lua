return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = "󰒲 Update",
            action = "Lazy update", 
            key = "u"
          },
          {
            desc = " Files",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = "󰚰 Recent files",
            action = "Telescope oldfiles",
            key = "r",
          },
          {
            desc = " dotfiles",
            action = "e ~/.config/nvim/",
            key = "d",
          },
        },
      },
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" }
  }
}
