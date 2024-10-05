return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "tabs",
				indicator = {
					style = "none",
				},
				show_buffer_close_icons = false,
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
