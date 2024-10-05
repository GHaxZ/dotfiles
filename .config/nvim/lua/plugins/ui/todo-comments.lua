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
	config = function()
		local todo_comments = require("todo-comments")

		todo_comments.setup({
			keywords = {
				FIX = {
					icon = " ",
					alt = { "FIXME", "BUG" },
				},
				TODO = { icon = " " },
				HACK = { icon = " " },
				WARN = { icon = " " },
				PERF = { icon = " 󰓅", alt = { "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", alt = { "INFO" } },
				TEST = { icon = " 󰙨" },
			},
		})
	end,
}
