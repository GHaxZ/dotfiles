return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		local languages = require("config.languages")

		lint.linters_by_ft = {}

		for _, lang in ipairs(languages) do
			if lang.linter then
				for _, ft in ipairs(lang.filetypes or { lang.filetype }) do
					lint.linters_by_ft[ft] = lint.linters_by_ft[ft] or {}
					table.insert(lint.linters_by_ft[ft], lang.linter)
				end
			end
		end

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
