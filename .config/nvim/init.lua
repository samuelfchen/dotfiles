require("samuel.plugins-setup")
-- core plugins
require("samuel.core.reload")
require("samuel.core.options")
require("samuel.core.keymaps")
require("samuel.core.colorscheme")

require("samuel.plugins.comment")
require("samuel.plugins.nvim-tree")
require("samuel.plugins.lualine")
require("samuel.plugins.telescope")
require("samuel.plugins.nvim-cmp")
require("samuel.plugins.treesitter")
require("samuel.plugins.which-key")
-- require("samuel.plugins.tabby")
require("samuel.plugins.bufferline")
require("samuel.plugins.gitsigns")

-- lsp 
require("samuel.plugins.lsp.lspconfig")
require("samuel.plugins.lsp.lspsaga")
require("samuel.plugins.lsp.mason")

-- typescript
-- require("samuel.plugins.typescript.nvim-ts-autotag")
require("samuel.plugins.typescript.prettier")

