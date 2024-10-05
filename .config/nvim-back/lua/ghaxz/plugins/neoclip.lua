return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
	},
	config = function()
		require("neoclip").setup({
			history = 1000,
		})

		vim.keymap.set("n", "<leader>ch", "<cmd>Telescope neoclip<CR>", { desc = "Clipboard history" })
	end,
}
