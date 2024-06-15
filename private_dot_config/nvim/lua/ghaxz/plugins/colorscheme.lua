return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    
    require("gruvbox").setup({
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true
    })

    vim.cmd("colorscheme gruvbox")
  end
}
