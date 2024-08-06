-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function() require("gruvbox").setup({
--       terminal_colors = true, -- add neovim terminal colors
--       undercurl = true,
--       underline = true,
--       bold = true,
--       italic = {
--         strings = true,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true, }, strikethrough = true
--     })
--
--     vim.cmd("colorscheme gruvbox")
--   end
-- }

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		local rose_pine = require("rose-pine")
--
-- 		rose_pine.setup({
-- 			variant = "moon",
-- 		})
--
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }

-- return {
-- 	"zenbones-theme/zenbones.nvim",
-- 	dependencies = { "rktjmp/lush.nvim" },
-- 	config = function()
-- 		vim.cmd("colorscheme kanagawabones")
-- 	end,
-- }

return {
	"rebelot/kanagawa.nvim",
	config = function()
		vim.cmd("colorscheme kanagawa-wave")
	end,
}
