return {
	"nvim-neorg/neorg",
	ft = "norg", -- Lazy load this plugin as soon as a .norg file is opened
	version = "*", -- Pin the version so breaking changes have to be installed manually
	config = function()
		require("neorg").setup({
			load = {
				-- Load defaults
				["core.defaults"] = {},

				-- Configuration for the concealer module
				["core.concealer"] = {
					config = {
						icon_preset = "diamond",
						init_open_folds = "auto",
						icons = {
							todo = {
								uncertain = {
									icon = "?",
								},
							},
						},
					},
				},

				-- Configuration for the dirman module
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},

				-- Configuration for the metagen module
				["core.esupports.metagen"] = {
					config = {
						type = "auto",
						author = "GHaxZ",
					},
				},

				-- Configuration for the summary module
				["core.summary"] = {},

				-- Configuration for the export module
				["core.export"] = {},
			},
		})

		-- This fixes some issues with for example links not being concealled correctly
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = { "*.norg" },
			command = "set conceallevel=3",
		})
	end,
}
