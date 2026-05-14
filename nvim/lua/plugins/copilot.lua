-- =============================================================================
-- lua/plugins/copilot.lua
-- GitHub Copilot — standalone (bypasses broken lazyvim extras on Windows)
--
-- FIRST-TIME SETUP:
--   :Copilot auth  → follow the browser link → done
-- =============================================================================

return {

  -- ── Copilot inline completions ────────────────────────────────────────────
  {
    "zbirenbaum/copilot.lua",
    cmd   = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts  = {
      suggestion = {
        enabled      = true,
        auto_trigger = true,
        debounce     = 75,
        keymap = {
          accept      = "<Tab>",
          accept_word = "<M-Right>",
          accept_line = "<M-Down>",
          next        = "<M-]>",
          prev        = "<M-[>",
          dismiss     = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        typescript      = true,
        javascript      = true,
        html            = true,
        go              = true,
        cpp             = true,
        c               = true,
        python          = true,
        sql             = true,
        css             = true,
        dockerfile      = true,
        lua             = true,
        yaml            = true,
        json            = true,
        bash            = true,
        sh              = true,
        markdown        = true,
        ["*"]           = false,
      },
    },
  },

  -- ── Copilot Chat ──────────────────────────────────────────────────────────
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch       = "main",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    cmd  = { "CopilotChat", "CopilotChatToggle" },
    opts = {
      model  = "gpt-4o",
      window = { layout = "vertical", width = 0.40 },
      context = "buffers",
      prompts = {
        Explain  = { prompt = "Write an explanation of the selected code." },
        Review   = { prompt = "Review the selected code and suggest improvements." },
        Fix      = { prompt = "Fix the issue in the selected code." },
        Optimize = { prompt = "Optimize the selected code for performance." },
        Docs     = { prompt = "Add docstring/JSDoc comments to the selected code." },
        Tests    = { prompt = "Write unit tests for the selected code." },
      },
    },
    keys = {
      { "<leader>ac", "<cmd>CopilotChatToggle<cr>",   desc = "Copilot Chat Toggle",    mode = { "n", "v" } },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>",  desc = "Copilot Explain",        mode = { "n", "v" } },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>",   desc = "Copilot Review",         mode = { "n", "v" } },
      { "<leader>af", "<cmd>CopilotChatFix<cr>",      desc = "Copilot Fix",            mode = { "n", "v" } },
      { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot Optimize",       mode = { "n", "v" } },
      { "<leader>at", "<cmd>CopilotChatTests<cr>",    desc = "Copilot Tests",          mode = { "n", "v" } },
      { "<leader>ad", "<cmd>CopilotChatDocs<cr>",     desc = "Copilot Docs",           mode = { "n", "v" } },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Copilot Quick Chat",
      },
    },
  },
}
