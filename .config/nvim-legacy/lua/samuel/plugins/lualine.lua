-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
-- local lualine_kanagawa = require("lualine.themes.kanagawa")

-- configure lualine with modified theme
lualine.setup({
  options = {
    -- theme = lualine_nightfly,
    theme = 'onedark',
  },
})
