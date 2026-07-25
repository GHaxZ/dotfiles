return {
	--  TODO:
	--  PERF:
	--  HACK:
	--  NOTE:
	--  FIX:
	--  WARNING:
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			FIX = { icon = " ", alt = { "FIXME", "BUG" } },
			TODO = { icon = " " },
			HACK = { icon = " " },
			WARN = { icon = " " },
			PERF = { icon = " 󰓅", alt = { "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", alt = { "INFO" } },
			TEST = { icon = " 󰙨" },
		},
	},
}
