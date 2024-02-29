return {
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('onedark').setup {
        -- Set a style preset. 'dark' is default.
        style = 'dark', -- dark, darker, cool, deep, warm, warmer, light

        highlights = {
          IlluminatedWordText = { bg = '#5c6370' },
          IlluminatedWordRead = { bg = '#5c6370' },
          IlluminatedWordWrite = { bg = '#5c6370' },
        },
      }
      require('onedark').load()
    end,
  },
}
