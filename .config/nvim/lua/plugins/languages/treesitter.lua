-- Load the centralized language config
local languages = require("config.languages")

-- Function to collect treesitter parsers from the languages table
local function get_treesitter_parsers()
	local parsers = {}

	-- Loop through all languages
	for _, lang in pairs(languages) do
		-- Check if this language has any treesitter parsers configured (is not nil)
		if lang.treesitter then
			for _, parser in ipairs(lang.treesitter) do
				table.insert(parsers, parser)
			end
		end
	end

	return parsers
end

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag", -- Autoclose and auto rename html tags
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			autotag = {
				enable = true,
			},

			ensure_installed = get_treesitter_parsers(),

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
