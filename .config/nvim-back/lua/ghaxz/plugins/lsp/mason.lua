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

		-- Enable and configure mason
		mason.setup({})

		mason_lspconfig.setup({
			-- List of servers for mason to install
			ensure_installed = {
				"bashls", -- bash
				"clangd", -- C and C++
				"cmake", -- Makefiles
				"cssls", -- CSS
				"dockerls", -- Dockerfiles
				"gopls", -- Go
				"html", -- Haskell (just kidding, it's obvious)
				"jsonls", -- JSON
				"jdtls", -- Java
				"marksman", -- Markdown
				"ts_ls", -- JavaScript and TypeScript
				"rust_analyzer", -- Rust
				"lua_ls", -- lua
				"ruff", -- Python
				"taplo", -- TOML
				"yamlls", -- YAML
			},

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"beautysh",
					"clang-format",
					"stylua",
					"shellcheck",
					"cpplint",
					"checkstyle",
					"eslint_d",
					"goimports",
					"revive",
				},
			}),
		})
	end,
}
