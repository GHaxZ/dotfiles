return {
	"gbprod/yanky.nvim",
	event = "VeryLazy",
	opts = {
		ring = { history_length = 1000 },
	},
	keys = {
		{ "<leader>y", "<cmd>YankyRingHistory<CR>", desc = "Clipboard history" },
	},
}
