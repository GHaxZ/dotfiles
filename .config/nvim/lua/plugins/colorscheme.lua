return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	opts = {
		theme = "wave",
	},
	config = function(_, opts)
		require("kanagawa").setup(opts)
		vim.cmd("colorscheme kanagawa-wave")
	end,
}
