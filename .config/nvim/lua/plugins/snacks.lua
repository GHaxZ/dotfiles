return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = table.concat({
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
					[[ ⠀⠙⣿⣿⣿⣿⣿⠿⢋⠼⠛⡰⢁⣼⡞⠝⢿⣴⠹⢂⣿⣟⡿⣿⡿⣿⣿⣿⣿⣿⣿⣿⢷⣻⣿⡿⢿⡟⠁⠀]],
					[[ ⠀⠀⠈⠻⠟⠋⠡⠐⢁⡠⢔⣞⢋⡭⠱⠶⠛⠈⢡⣾⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣷⣻⣞⡀⠊⠀⠀⠀]],
					[[ ⠀⠀⠀⠀⠀⠲⢾⣟⡷⣭⣾⣷⡻⠛⠁⠀⢀⣠⣿⠿⣾⠉⢒⣁⣼⣿⣿⣿⣿⡿⢗⠫⠹⠋⠀⠀⠀⠀⠀]],
					[[ ⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠋⢁⣀⣀⣤⣾⣟⠟⠃⠀⣈⣘⣯⣡⢻⣏⣀⠽⣿⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
					[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠛⠉⠀⠀⢴⡚⡻⠿⠛⠹⠟⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
				}, "\n"),
				keys = {
					{ icon = " ", key = "b", desc = "Browse files", action = ":e ." },
					{ icon = "󰈞 ", key = "f", desc = "Find file", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "r", desc = "Recent", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{ icon = " ", key = "d", desc = "Dotfiles", action = ":cd ~/.config/nvim | e ." },
				},
			},
		},
		input = { enabled = true },
		indent = { enabled = true },
		notifier = { enabled = false }, -- fidget.nvim handles notifications + LSP progress
		picker = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		zen = { enabled = true, backdrop = false },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files in cwd",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Find recent files",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find string in cwd",
		},
		{
			"<leader>sm",
			function()
				Snacks.zen.zoom()
			end,
			desc = "Maximize/minimize split",
		},
	},
}
