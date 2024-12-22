return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup({})
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  options = {
    -- keybinds for navigation in lspsaga window
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    -- use enter to open file with definition preview
    definition = {
      keys = {
        edit = "<CR>",
        vsplit = "a",
        split = "o",
        tabe = "t"
      }
    },
    ui = {
      colors = {
        normal_bg = "#022746",
      },
    },
  }
}
