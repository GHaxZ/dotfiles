return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	config = function()
		local markdown = require("render-markdown")

		markdown.setup({
			render_modes = { "n", "c" }, -- Only render in normal and command mode
			sign = {
				enabled = false, -- Disable signs
			},
		})
	end,
}
