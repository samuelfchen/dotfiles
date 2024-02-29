return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'pabloariasal/webify.nvim',
    config = function()
      vim.keymap.set('n', '<leader>gyl', '<cmd>YankLineUrl +<cr>')
      vim.keymap.set('n', '<leader>gyf', '<cmd>YankFileUrl +<cr>')
    end,
  },
}
