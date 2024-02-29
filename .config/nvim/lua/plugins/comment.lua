return {
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = {
      toggler = { line = '<leader>cc', block = '<leader>bc' },
      opleader = { line = '<leader>c', block = '<leader>b' },
      extra = { above = '<leader>cO', below = '<leader>co', eol = '<leader>cA' },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    },
  },
}
