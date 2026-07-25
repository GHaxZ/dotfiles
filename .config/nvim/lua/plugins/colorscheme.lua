return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme kanagawa-wave")
		-- Keep sign column background consistent on cursor line
		vim.api.nvim_set_hl(0, "CursorLineSign", { link = "SignColumn" })
	end,
}
