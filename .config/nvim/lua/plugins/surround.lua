return {
	"echasnovski/mini.surround",
	event = { "InsertEnter" },
	version = "*",
	config = function()
		local surround = require("mini.surround")

		surround.setup({
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				replace = "sr", -- Replace surrounding
				find = "", -- Disable find surrounding (to the right)
				find_left = "", -- Disable find surrounding (to the left)
				highlight = "", -- Disable highlight surrounding
				update_n_lines = "", -- Disable update `n_lines`

				suffix_last = "", -- Disable suffix to search with "prev" method
				suffix_next = "", -- Disable suffix to search with "next" method
			},

			silent = true, -- Don't display any non-error messages
		})
	end,
}
