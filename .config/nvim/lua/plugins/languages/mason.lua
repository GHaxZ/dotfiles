return {
	"williamboman/mason.nvim",

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- Load the languages configuration
		local languages = require("config.languages")

		-- Enable and configure mason
		mason.setup({})

		-- Prepare lists for lsp servers and tools
		local lsp_servers = {}
		local formatters = {}
		local linters = {}

		-- Iterate through languages to populate the lists
		for _, lang in ipairs(languages) do
			if lang.lsp and not lang.lsp_no_mason then
				table.insert(lsp_servers, lang.lsp)
			end

			if lang.formatter then
				table.insert(formatters, lang.formatter)
			end

			if lang.linter then
				table.insert(linters, lang.linter)
			end
		end

		mason_lspconfig.setup({
			-- List of servers for mason to install
			ensure_installed = lsp_servers,
		})

		mason_tool_installer.setup({
			-- List of other tools for mason to install
			ensure_installed = vim.list_extend(formatters, linters),
		})
	end,
}
