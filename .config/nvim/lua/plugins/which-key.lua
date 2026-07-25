return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		preset = "modern",
		spec = {
			{ "<leader>f", group = "find" },
			{ "<leader>s", group = "split/window" },
			{ "<leader>t", group = "tab" },
			{ "<leader>c", group = "code" },
			{ "<leader>y", group = "yank/clipboard" },
			{ "<leader>r", group = "rename/restart" },
		},
	},
}
