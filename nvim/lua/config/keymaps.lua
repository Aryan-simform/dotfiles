-- =============================================================================
-- Keymaps Configuration
-- Automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- =============================================================================

-- ── Select All ────────────────────────────────────────────────────────────────
-- Normal mode: select entire buffer
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })
-- Insert mode: escape then select entire buffer
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select all" })

-- ── Ctrl+Backspace (delete word) ──────────────────────────────────────────────
-- Simulates Ctrl+Backspace to delete the previous word (like most editors)
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true, silent = true, desc = "Delete previous word" })

-- ── Terminal Toggle ───────────────────────────────────────────────────────────
vim.keymap.set({ "n", "t" }, "<C-/>", function()
  require("snacks").terminal.toggle()
end, { desc = "Toggle Snacks Terminal" })

-- ── Diagnostics ───────────────────────────────────────────────────────────────
-- Show diagnostic float (wrapped / word-wrapped friendly)
vim.keymap.set("n", "<leader>k", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostic (wrapped)" })

-- Send diagnostics to location list
vim.keymap.set("n", "<leader>xl", vim.diagnostic.setloclist, {
  desc = "Diagnostics to loclist",
})

-- Send diagnostics to quickfix list
vim.keymap.set("n", "<leader>xq", vim.diagnostic.setqflist, {
  desc = "Diagnostics to quickfix",
})

-- ── Buffer Navigation ─────────────────────────────────────────────────────────
-- Switch buffers with Shift+H / Shift+L (already in LazyVim defaults, kept for clarity)
-- vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- ── Save ──────────────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
