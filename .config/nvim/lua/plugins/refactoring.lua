return {
	"ThePrimeagen/refactoring.nvim",
	event = { "InsertEnter" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.keymap.set({ "n", "x" }, "<leader>r", function()
			require("refactoring").select_refactor()
		end)
	end,
}
