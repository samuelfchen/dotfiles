return {
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('oil').setup({
        keymaps = {
          ["q"] = "actions.close",
          ["<C-h>"] = false,
          ["<C-s>"] = false,
          ["<C-l>"] = false
        }
      })

      vim.keymap.set('n', "-", "<cmd>Oil<cr>")
    end
  }
}
