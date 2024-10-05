return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠴⡖⣶⣶⣶⣦⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⣴⣿⣿⣸⣿⣳⣯⢽⣿⣻⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠲⣎⣿⡟⣿⣯⡿⠋⠉⡹⡴⠛⢓⣻⣿⣻⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠲⢶⣿⣶⣯⣿⣷⡘⡹⠫⠀⠀⠀⠀⠈⠀⠐⠉⠁⠘⡙⣽⣿⣿⣿⣷⣄⠀⠀⠀⠀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⠯⣯⣷⣽⣿⠿⠿⠁⠀⠠⢀⠀⠀⠂⠁⠘⢀⣀⢀⣠⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⢤⢾⡿⠛⡍⡝⠏⠀⠀⠀⠉⠃⠀⠄⠄⠑⢂⠡⢻⣿⣿⣿⣿⣿⣿⣿⡿⣿⡿⣷⡀⠀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⠑⠂⠉⠀⠀⠀⠀⠀⠀⠀⠀⢠⡔⣤⣽⣿⠟⣧⢷⢷⣟⣿⣿⣷⣫⣿⣿⠛⢷⠀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠠⡹⡻⠩⠃⢡⣐⣠⣿⣵⣿⡿⡿⣁⢡⣀⣾⠇]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁⠂⡀⠀⡑⠐⡀⢀⡺⢿⣯⠗⠛⠽⠷⣷⠐⠠⠱⡉⢀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣶⣿⣿⣄⠀⠀⠉⠈⠁⠀⢓⢂⠀⠃⠐⠑⣂⣔⡞]],
			[[ ⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣷⣮⡀⠌⠀⠔⡀⠨⣅⣠⣾⣼⡻⣽⡇]],
			[[ ⢀⣠⣴⢿⡿⠷⣤⢀⡀⠀⠀⠀⠀⣠⣶⣶⣿⣿⣿⣿⣿⣿⣻⣿⣻⣿⣿⣿⣷⣾⣍⡙⢓⣯⡿⣿⣏⠿⠋⠀]],
			[[ ⠀⣅⠀⢈⠁⠘⢋⣉⣈⣤⣤⡴⣿⠿⣿⣿⣿⡽⢻⣯⣿⣿⡿⣾⣼⣿⣏⣿⣿⣿⣿⣿⢿⣿⣿⣿⣶⣶⠀⠀]],
			[[ ⠀⠙⣿⣿⣿⣿⣿⠿⢋⠼⠛⡰⢁⣼⡞⠝⢿⣴⠹⢂⣿⣟⡿⣿⡿⣿⣿⣿⣿⣿⣿⢷⣻⣿⡿⢿⡟⠁⠀⠀]],
			[[ ⠀⠀⠈⠻⠟⠋⠡⠐⢁⡠⢔⣞⢋⡭⠱⠶⠛⠈⢡⣾⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣷⣻⣞⡀⠊⠀⠀⠀⠀]],
			[[ ⠀⠀⠀⠀⠀⠲⢾⣟⡷⣭⣾⣷⡻⠛⠁⠀⢀⣠⣿⠿⣾⠉⢒⣁⣼⣿⣿⣿⣿⡿⢗⠫⠹⠋⠀⠀⠀⠀⠀⠀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠋⢁⣀⣀⣤⣾⣟⠟⠃⠀⣈⣘⣯⣡⢻⣏⣀⠽⣿⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠛⠉⠀⠀⢴⡚⡻⠿⠛⠹⠟⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("b", "  Browse files", ":e .<CR>"),
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("d", "  Dotfiles", ":cd ~/.config/nvim | e .<CR>"),
		}

		-- Once lazy finished loading all plugins
		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				-- Use the stats api to get lazy stats
				local stats = require("lazy").stats()

				-- Format the time correctly
				local time = (math.floor(stats.startuptime * 100 + 0.5) / 100)

				-- Set the footer text
				--
				-- ┌  Loaded 20/25 plugins ┐
				-- └   Started in 57.75ms  ┘
				--
				dashboard.section.footer.val = {
					"┌  Loaded " .. stats.loaded + 2 .. "/" .. stats.count .. " plugins ┐",
					"└   Started in " .. time .. "ms  ┘",
				}

				-- Issue a redraw of the dashboard
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		alpha.setup(dashboard.opts)
	end,
}
