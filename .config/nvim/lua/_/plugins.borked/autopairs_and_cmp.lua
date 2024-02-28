return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },

    config = function() 
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }

    end
  }
}

-- ---@diagnostic disable: missing-fields
--
-- return {
-- 	{
-- 		"hrsh7th/nvim-cmp",
-- 		event = { "BufReadPost", "BufNewFile" },
-- 		dependencies = {
-- 			"hrsh7th/cmp-nvim-lsp",
-- 			"hrsh7th/cmp-buffer",
-- 			"hrsh7th/cmp-path",
-- 			"L3MON4D3/LuaSnip",
-- 			"saadparwaiz1/cmp_luasnip",
-- 			"rafamadriz/friendly-snippets",
-- 			"onsails/lspkind.nvim",
-- 			"windwp/nvim-ts-autotag",
-- 			"windwp/nvim-autopairs",
-- 		},
-- 		config = function()
-- 			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- 			local cmp = require("cmp")
-- 			local luasnip = require("luasnip")
-- 			local lspkind = require("lspkind")
--
-- 			require("nvim-autopairs").setup()
--
-- 			-- Integrate nvim-autopairs with cmp
-- 			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
--
-- 			-- Load snippets
-- 			require("luasnip.loaders.from_vscode").lazy_load()
--
-- 			cmp.setup({
-- 				snippet = {
-- 					expand = function(args)
-- 						luasnip.lsp_expand(args.body)
-- 					end,
-- 				},
-- 				window = {
-- 					completion = cmp.config.window.bordered(),
-- 					documentation = cmp.config.window.bordered(),
-- 				},
-- 				mapping = cmp.mapping.preset.insert({
-- 					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
-- 					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
-- 					["<Tab>"] = cmp.mapping(function(fallback)
-- 						if cmp.visible() then
-- 							cmp.select_next_item()
-- 						elseif luasnip.expand_or_jumpable() then
-- 							luasnip.expand_or_jump()
-- 						else
-- 							fallback()
-- 						end
-- 					end, { "i", "s" }),
-- 					["<S-Tab>"] = cmp.mapping(function(fallback)
-- 						if cmp.visible() then
-- 							cmp.select_prev_item()
-- 						elseif luasnip.jumpable(-1) then
-- 							luasnip.jump(-1)
-- 						else
-- 							fallback()
-- 						end
-- 					end, { "i", "s" }),
-- 					["<C-u>"] = cmp.mapping.scroll_docs(4), -- scroll up preview
-- 					["<C-d>"] = cmp.mapping.scroll_docs(-4), -- scroll down preview
-- 					["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
-- 					["<C-c>"] = cmp.mapping.abort(), -- close completion window
-- 					["<CR>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
-- 				}),
-- 				-- sources for autocompletion
-- 				sources = cmp.config.sources({
-- 					{ name = "copilot" }, -- Copilot suggestions
-- 					{ name = "nvim_lsp" }, -- lsp
-- 					{ name = "luasnip", max_item_count = 3 }, -- snippets
-- 					{ name = "buffer", max_item_count = 5 }, -- text within current buffer
-- 					{ name = "path", max_item_count = 3 }, -- file system paths
-- 				}),
-- 				-- Enable pictogram icons for lsp/autocompletion
-- 				formatting = {
-- 					expandable_indicator = true,
-- 					format = lspkind.cmp_format({
-- 						mode = "symbol_text",
-- 						maxwidth = 50,
-- 						ellipsis_char = "...",
-- 					}),
-- 				},
-- 				experimental = {
-- 					ghost_text = false,
-- 				},
-- 			})
-- 		end,
-- 	},
-- }
