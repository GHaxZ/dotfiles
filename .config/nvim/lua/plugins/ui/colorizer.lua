return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local colors = require("nvim-highlight-colors")

		colors.setup({
			render = "virtual", -- Display colors as symbol next to color text
			virtual_symbol = "󱓻", -- Set the symbol which is shown next to text
			virtual_symbol_position = "inline", -- Where the symbol should be displayed
			enable_tailwind = true, -- Display tailwind color classes e.g. "bg-blue-500"
		})
	end,
}
