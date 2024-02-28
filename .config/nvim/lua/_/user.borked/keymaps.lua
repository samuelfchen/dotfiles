vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sn", "<C-w>w") -- cycle to next window 
vim.keymap.set("n", "<leader>sp", "<C-w>p") -- cycle to previous window 
vim.keymap.set("n", "<leader>sd", ":close<CR>") -- close current split window

-- reload vimrc
vim.keymap.set("n", "<leader><CR>", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false }) 

vim.keymap.set("i", "kj", "<Esc>")

-- saving and/or exiting (more in vim_bbye.lua)
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>W", "<cmd>wq<cr>")

-- exit which-key
vim.keymap.set("n", "<leader><leader>", "<ESC>")
vim.keymap.set("n", "<leader>kj", "<ESC>")


-- diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>D', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


