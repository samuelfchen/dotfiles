-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness


-- Utility function to get visual selection
function vim.getVisualSelection() vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

---------------------
-- General Keymaps
---------------------

-- reload vimrc
keymap.set("n", "<leader><CR>", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })


-- use jk to exit insert mode
keymap.set("i", "kj", "<ESC>")
-- keymap.set("n", "kj", "<ESC>")
-- keymap.set("v", "kj", "<ESC>")

-- exit which-key
keymap.set("n", "<leader><leader>", "<ESC>")
keymap.set("n", "<leader>kj", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>n", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sn", "<C-w>w") -- cycle to next window 
keymap.set("n", "<leader>sp", "<C-w>p") -- cycle to previous window 
keymap.set("n", "<leader>sd", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>td", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- buffer management
keymap.set("n", "L", ":bnext<CR>") -- next buffer
keymap.set("n", "H", ":bprev<CR>") -- prev buffer

-- repeat colon commands
keymap.set("n", "<leader>r", "@:") -- repeat last colon command
-- keymap.set("n", "<leader>R", "@:") -- repeat last colon command

-- save and close
keymap.set("n", "<leader>w", ":update<cr>")
keymap.set("n", "<leader>W", ":wq<cr>")
keymap.set("n", "<leader>q", ":Bdelete<cr>")
keymap.set("n", "<leader>Q", ":Bdelete!<cr>")
keymap.set("n", "<leader>z", ":qa!")


----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- oil.nvim
keymap.set("n", "<leader>o.", ":Oil .<CR>")
keymap.set("n", "-", "<CMD>Oil<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fj", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>") -- list references
keymap.set("n", "<leader>fh", "<cmd>lua require('telescope').extensions.recent_files.pick()<CR>") -- list references

-- prettier
keymap.set("n", "<leader>p", "<cmd>Prettier<cr>") -- list available help tags

-- git
keymap.set("n", "<leader>gg", "<cmd>Git<cr>")
keymap.set("n", "<leader>gd", "<cmd>Gvdiff<cr>")
keymap.set("n", "<leader>gyl", "<cmd>YankLineUrl +<cr>")
keymap.set("n", "<leader>gyf", "<cmd>YankFileUrl +<cr>")

-- lsp
keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>")

-- trouble
keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

