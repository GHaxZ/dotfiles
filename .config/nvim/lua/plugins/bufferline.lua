return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			mode = "tabs",
			indicator = { style = "none" },
			show_buffer_close_icons = false,
			diagnostics = "nvim_lsp",
		},
	},
}
