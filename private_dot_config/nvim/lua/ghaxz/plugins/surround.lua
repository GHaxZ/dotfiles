return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  config = function()
    local surround = require("nvim-surround")

    surround.setup({
    keymaps =  {
        normal = "ys", -- select text with motion
        normal_cur = "yss", -- select entire line at cursor
      }
  })
  end
}
