-- LspAttach keymaps (moved here from lspconfig plugin)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = function(desc)
			return { buffer = ev.buf, silent = true, desc = desc }
		end

		vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

		vim.keymap.set("n", "gr", function()
			Snacks.picker.lsp_references()
		end, opts("Show LSP references"))
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
		vim.keymap.set("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, opts("Show LSP definitions"))
		vim.keymap.set("n", "gi", function()
			Snacks.picker.lsp_implementations()
		end, opts("Show LSP implementations"))
		vim.keymap.set("n", "gt", function()
			Snacks.picker.lsp_type_definitions()
		end, opts("Show LSP type definitions"))
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions"))
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename"))
		vim.keymap.set("n", "<leader>D", function()
			Snacks.picker.diagnostics_buffer()
		end, opts("Show buffer diagnostics"))
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts("Show line diagnostics"))
		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts("Restart LSP"))
	end,
})
