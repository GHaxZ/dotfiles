return {
	"hrsh7th/nvim-cmp", -- Autocompletion engine
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-buffer", lazy = true }, -- Source for text in buffer
		{ "hrsh7th/cmp-path", lazy = true }, -- Source for file system paths
		{
			"L3MON4D3/LuaSnip", -- Snippet engine, which also allows for custom snippet definitions
			version = "v2.*", -- follow latest release
			lazy = true,
		},
		{ "saadparwaiz1/cmp_luasnip", lazy = true }, -- Integrates LuaSnip into nvim-cmp
		{ "rafamadriz/friendly-snippets", lazy = true }, -- Provides a set of snippets for many languages
		{ "onsails/lspkind.nvim", lazy = true }, -- Provides icons and short descriptions for autocompletions
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- Load snippets from friendy-snippets plugin
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			-- Define behaviour for completion window
			completion = {
				-- "menu" -> Display the completion menu
				-- "menuone" -> Display the menu even if at least one completion is available
				-- "preview" -> Display a code preview of the completion
				-- "noselect" -> Don't select the first item automatically
				completeopt = "menu,menuone,preview,noselect",
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			-- Configure completion keybinds
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
				["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Scroll up in the completion docs
				["<C-d>"] = cmp.mapping.scroll_docs(4), -- Scroll down in the completion docs
				["<C-c>"] = cmp.mapping.abort(), -- Close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection
			}),

			-- Source order for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- snippets
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),

			-- Configure lspkind
			formatting = {
				format = function(entry, item)
					-- Make nvim-color-highlights work nicely with autocompletion
					local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })

					item = lspkind.cmp_format({
						-- Any lspkind settings here
						maxwidth = 50,
						ellipsis_char = "...",
					})(entry, item)
					if color_item.abbr_hl_group then
						item.kind_hl_group = color_item.abbr_hl_group
						item.kind = color_item.abbr
					end
					return item
				end,
			},
		})
	end,
}
