-- =============================================================================
-- lazy.lua — Plugin Manager Bootstrap
-- This is the entry point. Place at: ~/.config/nvim/lua/config/lazy.lua
-- =============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto-install lazy.nvim if not present (cross-platform)
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit...", "ErrorMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- ── LazyVim core ──────────────────────────────────────────────────────
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- ── Language Extras ───────────────────────────────────────────────────
    -- TypeScript / JavaScript / Node.js
    { import = "lazyvim.plugins.extras.lang.typescript" },

    -- Go
    { import = "lazyvim.plugins.extras.lang.go" },

    -- Python
    { import = "lazyvim.plugins.extras.lang.python" },

    -- C / C++
    { import = "lazyvim.plugins.extras.lang.clangd" },

    -- Docker (Dockerfile LS + hadolint linter)
    { import = "lazyvim.plugins.extras.lang.docker" },

    -- Tailwind CSS (works with HTML/Angular/React/Vue)
    { import = "lazyvim.plugins.extras.lang.tailwind" },

    -- SQL (vim-dadbod + sqls LSP)
    { import = "lazyvim.plugins.extras.lang.sql" },

    -- JSON (jsonls + SchemaStore)
    { import = "lazyvim.plugins.extras.lang.json" },

    -- YAML (yamlls + SchemaStore — useful for Docker Compose, K8s, etc.)
    { import = "lazyvim.plugins.extras.lang.yaml" },

    -- ── Coding Extras ─────────────────────────────────────────────────────
    -- GitHub Copilot  (see also lua/plugins/copilot.lua for customisation)
    -- { import = "lazyvim.plugins.extras.coding.copilot" },
    -- { import = "lazyvim.plugins.extras.coding.copilot-chat" },

    -- ── Formatting ────────────────────────────────────────────────────────
    { import = "lazyvim.plugins.extras.formatting.prettier" }, -- TS/JS/HTML/CSS/JSON

    -- ── Your local plugin specs ───────────────────────────────────────────
    { import = "plugins" }, -- loads everything in lua/plugins/*.lua
  },

  defaults = {
    -- Lazy-load plugins by default. Set to false to load all at startup.
    lazy = false,
    version = false, -- always use the latest git commit
  },

  install = {
    colorscheme = { "tokyonight", "habamax" },
  },

  checker = {
    enabled = true,  -- auto-check for plugin updates
    notify  = false, -- don't nag on startup
  },

  performance = {
    rtp = {
      -- Disable some built-in Neovim plugins for faster startup
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
