local languages = require("config.languages")

local function get_parsers()
	local parsers = {}
	for _, lang in ipairs(languages) do
		if lang.treesitter then
			for _, p in ipairs(lang.treesitter) do
				table.insert(parsers, p)
			end
		end
	end
	return parsers
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false, -- plugin does not support lazy loading
	build = ":TSUpdate",
	config = function()
		-- Install parsers (async, no-op if already installed)
		require("nvim-treesitter").install(get_parsers())

		-- Enable highlighting/folding/indent per filetype via built-in Neovim API
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TreesitterSetup", {}),
			callback = function(ev)
				pcall(function()
					vim.treesitter.start(ev.buf)
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end)
			end,
		})
	end,
}
