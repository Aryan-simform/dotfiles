vim.diagnostic.config({
  virtual_text = false, -- ❌ removes long inline errors
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
vim.diagnostic.config({
  float = {
    border = "rounded",
    max_width = math.floor(vim.o.columns * 0.6), -- ✅ THIS enables wrapping
    source = "always",
    focusable = false,
  },
})
