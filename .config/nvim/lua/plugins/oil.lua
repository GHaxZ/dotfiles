return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
			natural_order = true,
		},
		win_options = {
			wrap = true,
		},
		keymaps = {
			["<C-c>"] = false,
			["q"] = "actions.close",
		},
	},
	keys = {
		{ "<leader>e", "<CMD>Oil<CR>", desc = "Open file explorer" },
	},
}
