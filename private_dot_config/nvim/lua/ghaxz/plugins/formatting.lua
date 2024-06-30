return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				bash = { "beautysh" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				css = { "prettier" },
				go = { "gofumpt" },
				html = { "prettier" },
				java = { "clang-format" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				yaml = { "prettier" },
			},
			format_after_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format current buffer" })
	end,
}
