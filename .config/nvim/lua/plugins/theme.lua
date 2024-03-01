return {
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      require('onedark').setup {
        -- highlights = {
        --   IlluminatedWordText = { bg = '#e2be7d' },
        --   IlluminatedWordRead = { bg = '#e2be7d' },
        --   IlluminatedWordWrite = { bg = '#e2be7d' },
        --
        -- },
      }

      require('onedark').load()
    end,
  },
}
