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
				"html", -- Haskell (just kidding, it's obvious)
				"jsonls", -- JSON
				"jdtls", -- Java
				"tsserver", -- JavaScript and TypeScript
				"lua_ls", -- lua
				"pyright", -- Python
				"rust_analyzer", -- Rust
				"taplo", -- TOML
				"yamlls", -- YAML
			},

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"beautysh",
					"clang-format",
					"stylua",
					"isort",
					"black",
					"shellcheck",
					"cpplint",
					"checkstyle",
					"selene",
					"eslint_d",
					"pylint",
				},
			}),
		})
	end,
}
