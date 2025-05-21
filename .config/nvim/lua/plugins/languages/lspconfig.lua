return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-lua/plenary.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- modules
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- load your languages table
		local languages = require("config.languages")

		-- build a list of LSP names that Mason should install
		local to_install = {}
		for _, lang in ipairs(languages) do
			if lang.lsp and not lang.lsp_no_mason then
				table.insert(to_install, lang.lsp)
			end
		end

		-- Mason setup: install servers, auto-enable them
		mason_lspconfig.setup({
			ensure_installed = to_install,
			automatic_enable = true,
		})

		-- build capabilities for all servers
		local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- diagnostic signs
		local signs = { Error = " ", Warn = " ", Hint = " 󰠠", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- loop through every language entry and call setup()
		for _, lang in ipairs(languages) do
			-- choose the right server name: explicit .lsp or fallback to .name
			local server = lang.lsp or lang.name

			-- base opts with capabilities
			local opts = vim.tbl_deep_extend("force", { capabilities = capabilities }, lang.lsp_config or {})

			-- setup the server
			lspconfig[server].setup(opts)
		end

		-- your LspAttach autocmd + keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

				local keymap = vim.keymap
				keymap.set(
					"n",
					"gr",
					"<cmd>Telescope lsp_references<CR>",
					vim.tbl_extend("force", { desc = "Show LSP references" }, opts)
				)
				keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", { desc = "Go to declaration" }, opts)
				)
				keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					vim.tbl_extend("force", { desc = "Show LSP definitions" }, opts)
				)
				keymap.set(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					vim.tbl_extend("force", { desc = "Show LSP implementations" }, opts)
				)
				keymap.set(
					"n",
					"gt",
					"<cmd>Telescope lsp_type_definitions<CR>",
					vim.tbl_extend("force", { desc = "Show LSP type definitions" }, opts)
				)
				keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					vim.tbl_extend("force", { desc = "See available code actions" }, opts)
				)
				keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					vim.tbl_extend("force", { desc = "Smart rename" }, opts)
				)
				keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					vim.tbl_extend("force", { desc = "Show buffer diagnostics" }, opts)
				)
				keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					vim.tbl_extend("force", { desc = "Show line diagnostics" }, opts)
				)
				keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					vim.tbl_extend("force", { desc = "Show documentation under cursor" }, opts)
				)
				keymap.set(
					"n",
					"<leader>rs",
					":LspRestart<CR>",
					vim.tbl_extend("force", { desc = "Restart LSP" }, opts)
				)
			end,
		})
	end,
}
