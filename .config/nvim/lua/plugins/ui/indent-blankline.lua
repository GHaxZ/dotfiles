return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		local ibl = require("ibl")

		ibl.setup({
			indent = { char = "│" },
		})
	end,
}
