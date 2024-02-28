-- relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- tabs and indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.o.breakindent = true

-- line wrapping
vim.o.wrap = false

-- case insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- appearance
vim.o.termguicolors = true
vim.o.signcolumn = "yes"

-- cursor line
vim.o.cursorline = true

-- split windows (focus new window on split)
vim.o.splitright = true
vim.o.splitbelow = true

-- searching (TODO: fix this up to how I had it before)
vim.o.hlsearch = false
vim.o.incsearch = true

-- enable mouse mode
vim.o.mouse = 'a'

-- sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamed,unnamedplus'

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- save undo history
vim.o.undofile = true

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- decrease update time
vim.o.updatetime = 200
vim.o.timeoutlen = 300

-- set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- always keep liens below / above cursor when scrolling
vim.o.scrolloff = 5

-- column line
vim.o.colorcolumn = '80'

-- blinking cursor
vim.opt.guicursor = {
	"n-v-c:block", -- Normal, visual, command-line: block cursor
	"i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}
