return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local languages = require("config.languages") -- Load the languages configuration

		-- Initialize an empty table for formatters
		local formatters_by_ft = {}

		-- Populate formatters_by_ft from the languages list
		for _, lang in ipairs(languages) do
			if lang.formatter then
				for _, ft in ipairs(lang.filetypes) do
					formatters_by_ft[ft] = { lang.formatter }
				end
			end
		end

		conform.setup({
			formatters_by_ft = formatters_by_ft,

			format_after_save = {
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fb", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format current buffer" })
	end,
}
