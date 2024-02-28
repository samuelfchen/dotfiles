return {
  "pabloariasal/webify.nvim",
  config = function()
    vim.keymap.set("n", "<leader>gyl", "<cmd>YankLineUrl +<cr>")
    vim.keymap.set("n", "<leader>gyf", "<cmd>YankFileUrl +<cr>")
  end
}
