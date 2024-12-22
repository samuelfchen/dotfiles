
----------------------
-- Core keybinds, plugin specific keybinds are defined in plugin configs
----------------------

-- use kj for exit insert mode (should try and move away from this)
vim.keymap.set("i", "kj", "<ESC>")

-- exit which-key (do I still need this?)
-- vim.keymap.set("n", "<leader><leader>", "<ESC>")
-- vim.keymap.set("n", "<leader>kj", "<ESC>")

-- clear search highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- delete single character without copying into register (prolly don't need this one)
-- vim.keymap.set("n", "x", '"_x')

-- increment/decrement numbers (not used, disabled for now)
-- vim.keymap.set("n", "<leader>+", "<C-a>") -- increment
-- vim.keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sn", "<C-w>w") -- cycle to next window 
vim.keymap.set("n", "<leader>sp", "<C-w>p") -- cycle to previous window 
vim.keymap.set("n", "<leader>sd", ":close<CR>") -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>td", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- buffer management
vim.keymap.set("n", "L", ":bnext<CR>") -- next buffer
vim.keymap.set("n", "H", ":bprev<CR>") -- prev buffer

-- repeat colon commands (don't really use this, disabled for now)
-- vim.keymap.set("n", "<leader>r", "@:") -- repeat last colon command

-- save and close
vim.keymap.set("n", "<leader>w", ":update<cr>")
vim.keymap.set("n", "<leader>W", ":wq<cr>")
vim.keymap.set("n", "<leader>q", ":Bdelete<cr>")
vim.keymap.set("n", "<leader>Q", ":Bdelete!<cr>")
vim.keymap.set("n", "<leader>z", ":qa!")


-- paste from yank buffer
vim.keymap.set("n", "<leader>p", '"0p')
vim.keymap.set("n", "<leader>P", '"0P')


-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

