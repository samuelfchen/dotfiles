return {
  {
    'famiu/bufdelete.nvim',
    config = function()
      require("bufdelete")

      -- save and close
      vim.keymap.set("n", "<leader>w", ":update<cr>")
      vim.keymap.set("n", "<leader>W", ":wq<cr>")
      vim.keymap.set("n", "<leader>q", ":Bdelete<cr>")
      vim.keymap.set("n", "<leader>Q", ":Bdelete!<cr>")
      vim.keymap.set("n", "<leader>z", ":qa!")
    end
  }
}
