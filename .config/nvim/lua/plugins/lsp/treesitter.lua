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
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Official declarative parser installation:
			ensure_installed = get_parsers(),

			-- Do not block startup while installing
			sync_install = false,

			-- Automatically install parser on buffer enter if missing
			auto_install = true,
		})

		-- Built-in Neovim autocmd for highlighting and indent
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
