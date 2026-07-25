return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({})

		local languages = require("config.languages")
		local tools = {}
		for _, lang in ipairs(languages) do
			if lang.formatter then
				table.insert(tools, lang.formatter)
			end
			if lang.linter then
				table.insert(tools, lang.linter)
			end
		end

		require("mason-tool-installer").setup({
			ensure_installed = tools,
		})
	end,
}
