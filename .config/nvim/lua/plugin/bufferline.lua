return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
   'nvim-tree/nvim-web-devicons'
  },
  config = function()
    local bufferline = require('bufferline')

    bufferline.setup({
      options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        separator_style = "padded_slant",
        numbers = "none",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            },
        },
      },
      highlights = {
        tab_selected = {
          fg = "#ffffff",
        }
      },
    })
  end
}
