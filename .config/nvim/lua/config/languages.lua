-- All languages and their respective tools are defined centrally here, making it easy to add language tooling

return {

	-- Language configurations look like this:
	--
	-- {
	--   name = "bash", -- The name of the language, can be anything
	--   filetypes = {"bash", "sh"}, -- Filetypes associated with this language
	--   treesitter = {"bash"}, -- Treesitter parser names for this language, can be multiple
	--   lsp = "bashls", -- Lsp for this language, installed through mason.nvim, or can also be locally installed
	--   lsp_no_mason = false, -- Specify whether this lsp should be installed through mason.nvim
	--   lsp_config = { -- Custom lsp settings can also be applied
	--      setting = {
	--        ...
	--      }
	--   }
	--   formatter = "beautysh", -- Formatter for this language, installed through mason.nvim
	--   linter = "shellcheck", -- Linter for this language, installed through mason.nvim
	-- },
	--
	-- All of these values can be omitted or set to nil

	{
		name = "angular",
		filetypes = { "angular" },
		treesitter = { "angular" },
		lsp = "angularls",
	},
	{
		name = "bash",
		filetypes = { "bash", "sh" },
		treesitter = { "bash" },
		lsp = "bashls",
		formatter = "beautysh",
		linter = "shellcheck",
	},
	{
		name = "c",
		filetypes = { "c" },
		treesitter = { "c" },
		lsp = "clangd",
		formatter = "clang-format",
		linter = "cpplint",
	},
	{
		name = "cmake",
		filetypes = { "cmake" },
		treesitter = { "cmake" },
		lsp = "cmake",
	},
	{
		name = "cpp",
		filetypes = { "cpp" },
		treesitter = { "cpp" },
		lsp = "clangd",
		formatter = "clang-format",
		linter = "cpplint",
	},
	{
		name = "css",
		filetypes = { "css", "scss" },
		treesitter = { "css" },
		lsp = "cssls",
		formatter = "prettier",
	},
	{
		name = "dockerfile",
		filetypes = { "dockerfile" },
		treesitter = { "dockerfile" },
	},
	{
		name = "gitignore",
		filetypes = { "gitignore" },
		treesitter = { "gitignore" },
	},
	{
		name = "gleam",
		filetypes = { "gleam" },
		treesitter = { "gleam" },
		lsp = "gleam",
		lsp_no_mason = true,
	},
	{
		name = "go",
		filetypes = { "go" },
		treesitter = { "go" },
		lsp = "gopls",
		formatter = "goimports",
		linter = "revive",
	},
	{
		name = "html",
		filetypes = { "html" },
		treesitter = { "html" },
		lsp = "html",
		formatter = "prettier",
	},
	{
		name = "java",
		filetypes = { "java" },
		treesitter = { "java" },
		lsp = "jdtls",
		formatter = "clang-format",
		linter = "checkstyle",
	},
	{
		name = "javascript",
		filetypes = { "js", "jsx" },
		treesitter = { "javascript" },
		lsp = "ts_ls",
		formatter = "prettier",
		linter = "eslint_d",
	},
	{
		name = "typescript",
		filetypes = { "ts", "tsx" },
		treesitter = { "typescript" },
		lsp = "ts_ls",
		formatter = "prettier",
		linter = "eslint_d",
	},
	{
		name = "json",
		filetypes = { "json", "json" },
		treesitter = { "json" },
		formatter = "prettier",
	},
	{
		name = "jsonc",
		filetypes = { "jsonc" },
		treesitter = { "jsonc" },
		formatter = "prettier",
	},
	{
		name = "lua",
		filetypes = { "lua" },
		treesitter = { "lua" },
		lsp = "lua_ls",
		lsp_config = {
			settings = {
				Lua = {
					-- Make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
		formatter = "stylua",
	},
	{
		name = "markdown",
		filetypes = { "markdown", "md" },
		treesitter = { "markdown", "markdown_inline" },
		formatter = "prettier",
	},
	{
		name = "python",
		filetypes = { "python" },
		treesitter = { "python" },
		lsp = "pyright",
		formatter = "black",
		linter = "ruff",
	},
	{
		name = "query",
		treesitter = { "query" },
	},
	{
		name = "regex",
		treesitter = { "regex" },
	},
	{
		name = "rust",
		filetypes = { "rust" },
		treesitter = { "rust" },
		lsp = "rust_analyzer",
		lsp_config = {
			setting = {
				checkOnSave = {
					command = "clippy",
				},
				completions = {
					completeRustImports = true,
				},
			},
		},
	},
	{
		name = "svelte",
		filetypes = { "svelte" },
		treesitter = { "svelte" },
		lsp = "svelte",
	},
	{
		name = "tailwind",
		filetypes = {
			"ejs",
			"gohtml",
			"gohtmltmpl",
			"html",
			"css",
			"sass",
			"scss",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
			"angular",
		},
		lsp = "tailwindcss",
	},
	{
		name = "toml",
		filetypes = { "toml" },
		treesitter = { "toml" },
		lsp = "taplo",
	},
	{
		name = "vim",
		filetypes = { "vim" },
		treesitter = { "vim" },
	},
	{
		name = "vimdoc",
		filetypes = { "vimdoc" },
		treesitter = { "vimdoc" },
	},
	{
		name = "wit",
		filetypes = { "wit" },
		treesitter = { "wit" },
	},
	{
		name = "yaml",
		filetypes = { "yaml", "yml" },
		treesitter = { "yaml" },
		lsp = "yamlls",
		formatter = "prettier",
	},
	{
		name = "zig",
		filetypes = { "zig" },
		treesitter = { "zig" },
		lsp = "zls",
	},
}
