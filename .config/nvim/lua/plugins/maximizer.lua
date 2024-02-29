return {
  {
    'szw/vim-maximizer',
    config = function()
      vim.keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>') -- toggle split window maximization
    end,
  },
}
