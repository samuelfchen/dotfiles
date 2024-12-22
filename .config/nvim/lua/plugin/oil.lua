return {
  'stevearc/oil.nvim',
  config = function ()
    require("oil").setup({
        keymaps = {
            ["q"] = "actions.close",
            ["<C-h>"] = false,
            ["<C-s>"] = false,
            ["<C-l>"] = false
          }
    })

    vim.keymap.set("n", "<leader>o.", ":Oil .<CR>")
    vim.keymap.set("n", "-", "<CMD>Oil<CR>")
  end
}
