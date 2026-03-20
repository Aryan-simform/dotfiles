-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- In normal mode: select entire buffer
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- In insert mode: escape, then select entire buffer
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })

-- The one to simulate ctrl + backspace
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, silent = true })

vim.keymap.set({ "n", "t" }, "<C-/>", function()
  require("snacks").terminal.toggle()
end, { desc = "Toggle Snacks Terminal" })

vim.keymap.set("n", "<leader>k", function()
  vim.diagnostic.open_float(nil, {
    focus = false,
  })
end, { desc = "Show diagnostic (wrapped)" })
