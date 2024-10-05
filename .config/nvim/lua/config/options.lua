-- Reload files on change
vim.o.autoread = true

local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- Insert spaces when tab key is used
opt.autoindent = true -- Copy indent from current line when starting new one

-- Don't wrap text
opt.wrap = false

-- Use current buffer title as window title
opt.title = true

-- Disable backups
opt.backup = false

-- Make sure at least 10 lines are visible above and below cursor
opt.scrolloff = 10

-- search setting
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Case sensitive when searching capital letters

-- Hightlight the line the cursor is on
opt.cursorline = true

-- Enable 24-bit color support
opt.termguicolors = true

-- Colorschemes with light and dark options will be dark
opt.background = "dark"

-- Allways show sign column (signs are error indicators and so on), so all text starts on the same column
opt.signcolumn = "yes"

-- Set backspace behaviour
opt.backspace = "indent,eol,start"

-- Use system clipboard as default yank and paste register
opt.clipboard:append("unnamedplus")

-- Define window splitting behaviour
opt.splitright = true -- Split vertical windows to the right
opt.splitbelow = true -- Split horizontal windows to the bottom
