-- =============================================================================
-- lua/plugins/languages.lua
-- Handles languages NOT covered by LazyVim built-in extras:
--   • HTML (emmet + html-lsp)
--   • Angular (angularls)
--   • PostgreSQL (via pgformatter / postgres_lsp)
-- =============================================================================

return {

  -- ── nvim-treesitter ───────────────────────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = {
        "typescript", "javascript", "tsx", "html", "css",
        "go", "gomod", "gosum", "python", "c", "cpp",
        "sql", "dockerfile", "lua", "json", "jsonc",
        "yaml", "toml", "bash", "markdown", "markdown_inline",
        "vim", "vimdoc", "regex", "comment",
      }
      return opts
    end,
    config = function(_, opts)
      local install = require("nvim-treesitter.install")
      install.compilers  = { "x86_64-linux-musl-gcc", "gcc", "cc" }
      install.prefer_git = true
      require("nvim-treesitter").setup(opts)
    end,
  },

  -- ── nvim-lspconfig — Angular + HTML + PostgreSQL ─────────────────────────
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {
          filetypes = { "html", "htmldjango", "handlebars" },
          init_options = { provideFormatter = false },
        },
        cssls = {},
        angularls = {
          filetypes = { "typescript", "html", "typescriptreact", "angular" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("angular.json", "project.json")(fname)
          end,
          on_new_config = function(new_config, new_root_dir)
            new_config.cmd = {
              "ngserver", "--stdio",
              "--tsProbeLocations", new_root_dir,
              "--ngProbeLocations", new_root_dir,
            }
          end,
        },
        sqlls = {
          filetypes = { "sql", "mysql", "plsql" },
          settings = {
            sqlLanguageServer = {
              lint = { rules = { ["align-column-to-the-first"] = "off" } },
            },
          },
        },
      },
    },
  },

  -- ── mason-tool-installer — extra tools not covered by LazyVim extras ─────
  -- Installs AFTER Mason is ready, avoiding the race condition
-- ── Mason — manual install to avoid race condition ────────────────────────
  {
    "mason-org/mason.nvim",
    config = function(_, opts)
      require("mason").setup(opts)

      local mr = require("mason-registry")

      local extra_tools = {
        "angular-language-server",
        "emmet-ls",
        "sql-formatter",
        "codelldb",
        "delve",
        "debugpy",
        "hadolint",
        "stylua",
        "taplo",
        "eslint-lsp",
        "prettier",
        "css-lsp",
        "html-lsp",
      }

      -- Refresh registry first, then install only what isn't already installed
      -- This avoids the "Package is already installing" race condition
      mr.refresh(function()
        for _, tool in ipairs(extra_tools) do
          local ok, p = pcall(mr.get_package, tool)
          if ok and not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },

  -- ── Vim Dadbod — SQL/PostgreSQL DB client ─────────────────────────────────
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd  = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection" },
    keys = {
      { "<leader>Du", "<cmd>DBUIToggle<cr>",        desc = "DB UI Toggle" },
      { "<leader>Da", "<cmd>DBUIAddConnection<cr>", desc = "DB Add Connection" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location  = vim.fn.stdpath("data") .. "/db_ui"
    end,
  },

  -- ── Emmet ─────────────────────────────────────────────────────────────────
  {
    "olrtg/nvim-emmet",
    dependencies = { "neovim/nvim-lspconfig" },
    ft     = { "html", "css", "scss", "typescriptreact", "javascriptreact", "htmlangular" },
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>xe",
        require("nvim-emmet").wrap_with_abbreviation, { desc = "Emmet wrap" })
    end,
  },

  -- ── TypeScript error translation ──────────────────────────────────────────
  {
    "dmmulroy/ts-error-translator.nvim",
    ft     = { "typescript", "typescriptreact" },
    config = true,
  },

  -- ── Go DAP ────────────────────────────────────────────────────────────────
  {
    "leoluz/nvim-dap-go",
    ft     = "go",
    config = true,
  },

  -- ── C/C++ extensions ──────────────────────────────────────────────────────
  {
    "p00f/clangd_extensions.nvim",
    ft     = { "c", "cpp", "objc", "objcpp" },
    config = function()
      require("clangd_extensions").setup({
        inlay_hints = { inline = true },
        ast = { role_icons = { type = "󰦨", declaration = "󱇗" } },
      })
    end,
  },
}