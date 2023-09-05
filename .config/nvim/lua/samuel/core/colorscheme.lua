-- local status, _ = pcall(vim.cmd, "colorscheme kanagawa")
-- if not status then 
--   print("Colorscheme not found!")
--   return
-- end

require('onedark').setup({
  style = "darker"
})
require('onedark').load()
