vim.api.nvim_create_user_command('Cppath', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.keymap.set('n', '<leader>cp', '<cmd>Cppath<cr>')