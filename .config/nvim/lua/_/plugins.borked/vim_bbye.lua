return {
  {
    "moll/vim-bbye",
    config = function()
      require("vim-bbye").setup()

      vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<cr>")
      vim.keymap.set("n", "<leader>Q", "<cmd>Bdelete!<cr>")
      vim.keymap.set("n", "<leader>z", "<cmd>qa!")
    end
  }
}
