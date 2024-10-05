return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true, -- Use oil as the file explorer
			delete_to_trash = true, -- Delete files to trash instead of thanos snapping them
			skip_confirm_for_simple_edits = true, -- Only require confirmation for dangerous edits

			-- Configure how files are displayed
			view_options = {
				show_hidden = true, -- Show "." and ".." directories
				natural_order = true, -- Sort in a more sensible way
			},

			-- Setting for oil buffers
			win_options = {
				wrap = true, -- Wrap text
			},

			-- Set keybinds for oil buffers
			keymaps = {
				["<C-c>"] = false, -- Disable Ctrl + C keybind
				["q"] = "actions.close", -- Use q instead for closing
			},
		})

		vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open file explorer" })
	end,
}
