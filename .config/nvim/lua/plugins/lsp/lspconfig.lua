local languages = require("config.languages")

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"antosha417/nvim-lsp-file-operations",
	},
	config = function()
		-- Modern diagnostic signs (fixes removed sign_define in 0.12.4)
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN]  = "",
					[vim.diagnostic.severity.HINT]  = "󰠠",
					[vim.diagnostic.severity.INFO]  = "",
				},
			},
		})

		-- Build capabilities from blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Define each server config via vim.lsp.config (modern API)
		-- Extends the defaults provided by nvim-lspconfig
		for _, lang in ipairs(languages) do
			if lang.lsp then
				vim.lsp.config[lang.lsp] = vim.tbl_deep_extend("force",
					vim.lsp.config[lang.lsp] or {},
					{ capabilities = capabilities },
					lang.lsp_config or {}
				)
			end
		end

		-- Build list of servers for mason to install
		local to_install = {}
		for _, lang in ipairs(languages) do
			if lang.lsp and not lang.lsp_no_mason then
				table.insert(to_install, lang.lsp)
			end
		end

		-- mason-lspconfig installs servers AND enables them via vim.lsp.enable()
		require("mason-lspconfig").setup({
			ensure_installed = to_install,
			automatic_enable = true,
		})

		-- Manually enable servers not managed by mason (e.g. gleam)
		for _, lang in ipairs(languages) do
			if lang.lsp and lang.lsp_no_mason then
				vim.lsp.enable(lang.lsp)
			end
		end

		-- Setup lsp-file-operations (for oil.nvim integration)
		require("lsp-file-operations").setup()
	end,
}
