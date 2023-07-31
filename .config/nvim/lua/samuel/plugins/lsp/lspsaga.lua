-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- use enter to open file with definition preview
  definition = {
    edit = "<CR>",
  },
  ui = {
    colors = {
      normal_bg = "#022746",
    },
  },
  mappings = {
    ['<Leader>ld'] = "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>",
    ['K'] = "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",
    ['gd'] = '<cmd>lua vim.lsp.buf.declaration()<CR>',
  }
})
