-- =============================================================================
-- lua/plugins/ui.lua
-- Quality-of-life and UI enhancements
-- =============================================================================

return {

  -- ── Colorscheme (TokyoNight — LazyVim default, customised) ───────────────
  {
    "folke/tokyonight.nvim",
    opts = {
      style       = "night",   -- "storm" | "moon" | "night" | "day"
      transparent = false,
      dim_inactive = true,
      styles = {
        comments    = { italic = true },
        keywords    = { italic = true },
        functions   = {},
        variables   = {},
      },
    },
  },

  -- ── Dashboard ─────────────────────────────────────────────────────────────
  {
    "nvimdev/dashboard-nvim",
    optional = true,
    opts = {
      config = {
        header = {
          "",
          " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
          " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
          " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
          " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
          "",
        },
      },
    },
  },

  -- ── Which-key — shows keybind hints ──────────────────────────────────────
  {
    "folke/which-key.nvim",
    opts = {
      -- Register our custom group labels
      spec = {
        { "<leader>a", group = "AI / Copilot" },
        { "<leader>D", group = "Database" },
        { "<leader>x", group = "Diagnostics / Lists" },
      },
    },
  },

  -- ── Better notifications ──────────────────────────────────────────────────
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      lsp = {
        -- Show progress messages for heavy LSPs like tsserver/pyright
        progress = { enabled = true },
      },
    },
  },

  -- ── Indent guides ─────────────────────────────────────────────────────────
  {
    "lukas-reineke/indent-blankline.nvim",
    optional = true,
    opts = {
      indent = { char = "│" },
      scope  = { enabled = true },
    },
  },

  -- ── Auto-close HTML/Angular tags ─────────────────────────────────────────
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html", "xml", "angular", "typescriptreact", "javascriptreact",
      "svelte", "vue", "htmlangular",
    },
    opts = {
      opts = { enable_close_on_slash = true },
    },
  },

  -- ── Color preview for Tailwind / CSS ──────────────────────────────────────
  {
    "NvChad/nvim-colorizer.lua",
    ft  = { "css", "scss", "html", "typescript", "javascript", "typescriptreact" },
    opts = {
      user_default_options = {
        tailwind = true,
        css      = true,
        names    = false,
      },
    },
  },
}
