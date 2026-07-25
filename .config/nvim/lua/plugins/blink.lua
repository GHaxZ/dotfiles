return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "*",
	dependencies = { "rafamadriz/friendly-snippets" },
	opts = {
		keymap = {
			preset = "default",
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-c>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		appearance = { nerd_font_variant = "mono" },
		completion = {
			ghost_text = { enabled = true },
			documentation = { auto_show = true, auto_show_delay_ms = 500 },
			list = { selection = { preselect = false, auto_insert = false } },
			accept = { auto_brackets = { enabled = true } },
		},
		sources = { default = { "lsp", "path", "snippets", "buffer" } },
		snippets = { preset = "default" },
		signature = { enabled = true },
	},
}
