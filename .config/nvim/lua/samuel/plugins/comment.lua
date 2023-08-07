local setup, comment = pcall(require, "Comment")
if not setup then 
  return
end

comment.setup({
      toggler = { line = '<leader>cc', block = '<leader>bc' },
      opleader = { line = '<leader>c', block = '<leader>b' },
      extra = { above = '<leader>cO', below = '<leader>co', eol = '<leader>cA' },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }
)
