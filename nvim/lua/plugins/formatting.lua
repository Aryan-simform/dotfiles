-- =============================================================================
-- lua/plugins/formatting.lua
-- conform.nvim (formatting) + nvim-lint (linting)
-- Prettier handles JS/TS/HTML/CSS/JSON; language-specific formatters for the rest
-- =============================================================================

return {

  -- ── conform.nvim — formatting ─────────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Web
        javascript        = { "prettier" },
        javascriptreact   = { "prettier" },
        typescript        = { "prettier" },
        typescriptreact   = { "prettier" },
        html              = { "prettier" },
        css               = { "prettier" },
        scss              = { "prettier" },
        json              = { "prettier" },
        jsonc             = { "prettier" },
        yaml              = { "prettier" },
        markdown          = { "prettier" },

        -- Angular (templates)
        htmlangular       = { "prettier" },

        -- Go
        go                = { "goimports", "gofmt" },

        -- Python
        python            = { "isort", "black" },

        -- C / C++
        c                 = { "clang_format" },
        cpp               = { "clang_format" },

        -- SQL / PostgreSQL
        sql               = { "sql_formatter" },

        -- Lua (Neovim config)
        lua               = { "stylua" },

        -- Shell (Git Bash / bash scripts)
        sh                = { "shfmt" },
        bash              = { "shfmt" },
      },

      -- Format on save  (set to false if you prefer manual :Format)
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,   -- fall back to LSP formatter if none configured
      },

      -- Formatter-specific settings
      formatters = {
        prettier = {
          -- Let prettier pick up .prettierrc automatically
          -- add --prose-wrap=always for markdown if needed
          args = function(_, ctx)
            local args = { "--stdin-filepath", "$FILENAME" }
            -- Use tabs for Go-style languages — override per project via .prettierrc
            return args
          end,
        },
        shfmt = {
          -- 2-space indentation, indent switch cases
          prepend_args = { "-i", "2", "-ci" },
        },
        black = {
          prepend_args = { "--line-length", "88" },
        },
      },
    },
  },

  -- ── nvim-lint — linting ───────────────────────────────────────────────────
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript        = { "eslint_d" },
        javascriptreact   = { "eslint_d" },
        typescript        = { "eslint_d" },
        typescriptreact   = { "eslint_d" },
        htmlangular       = { "eslint_d" },
        dockerfile        = { "hadolint" },
        python            = { "ruff" },  -- ruff is faster than flake8
        go                = { "golangcilint" },
      },
    },
  },
}
