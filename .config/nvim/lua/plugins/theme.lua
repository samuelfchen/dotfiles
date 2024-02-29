return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      require('onedarkpro').setup {
        -- highlights = {
        --   IlluminatedWordText = { bg = '#e2be7d' },
        --   IlluminatedWordRead = { bg = '#e2be7d' },
        --   IlluminatedWordWrite = { bg = '#e2be7d' },
        -- },
      }
      vim.cmd 'colorscheme onedark'
    end,
  },
}
