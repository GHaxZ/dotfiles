return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
			},
			float = {
				padding = 2,
				max_width = 90,
				max_height = 0,
			},
			win_options = {
				wrap = true,
				winblend = 0,
			},
			keymaps = {
				["<C-c>"] = false,
				["q"] = "actions.close",
			},
		})

		vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open file explorer" })
	end,
}
