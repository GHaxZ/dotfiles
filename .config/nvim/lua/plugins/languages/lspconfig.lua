return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-lua/plenary.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		-- Import required modules
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Load the languages configuration
		local languages = require("config.languages")

		-- Define capabilities for LSP clients
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = " 󰠠", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Setup LSP servers dynamically from the languages list
		mason_lspconfig.setup_handlers({
			function(server_name)
				-- Default setup for each server
				local server_config = {
					capabilities = capabilities,
				}

				-- Check for special configurations in the languages list
				for _, lang in ipairs(languages) do
					if lang.name == server_name then
						if lang.config then
							-- Merge the special configuration if it exists
							server_config = vim.tbl_deep_extend("force", server_config, lang.config)
						end
					end
				end

				lspconfig[server_name].setup(server_config)
			end,
		})

		-- Set LSP keybinds
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

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
					vim.tbl_extend("force", { desc = "Show documentation for what is under cursor" }, opts)
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
