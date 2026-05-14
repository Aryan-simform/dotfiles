-- =============================================================================
-- Options Configuration
-- Automatically loaded before lazy.nvim startup
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- clipboard via OSC52 (works without xclip/xsel)
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "

-- ── OS Detection ──────────────────────────────────────────────────────────────
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
local is_mac     = vim.fn.has("mac") == 1
local is_linux   = vim.fn.has("linux") == 1

-- ── Shell — Git Bash on Windows, system default elsewhere ────────────────────
-- This makes the terminal toggle (Ctrl+/) open Git Bash on Windows
-- and the native shell on Linux/macOS — no changes needed when switching OS.
if is_windows then
  -- Try Git Bash first; fall back to PowerShell if not found
  local git_bash = "C:/Program Files/Git/bin/bash.exe"
  if vim.fn.executable(git_bash) == 1 then
    vim.opt.shell     = git_bash
    vim.opt.shellcmdflag = "-c"
    vim.opt.shellxquote  = ""
    vim.opt.shellquote   = ""
    vim.opt.shellpipe    = "| tee"
    vim.opt.shellredir   = "> %s 2>&1"
    vim.opt.shellslash   = true  -- use forward slashes everywhere
  else
    -- Fallback: PowerShell
    vim.opt.shell        = "pwsh"
    vim.opt.shellcmdflag = "-NoLogo -NonInteractive -Command"
    vim.opt.shellxquote  = ""
  end
end

-- ── Editor ────────────────────────────────────────────────────────────────────
vim.opt.relativenumber = true      -- relative line numbers
vim.opt.number         = true      -- show current line number
vim.opt.tabstop        = 2         -- 2-space tabs (good for TS/JS/HTML/Angular)
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true      -- spaces, not tabs
vim.opt.smartindent    = true
vim.opt.wrap           = false     -- no line wrap by default
vim.opt.scrolloff      = 8         -- keep 8 lines visible above/below cursor
vim.opt.sidescrolloff  = 8
vim.opt.termguicolors  = true

-- ── Files ─────────────────────────────────────────────────────────────────────
vim.opt.fileformats = "unix,dos"   -- prefer LF, tolerate CRLF (important on Windows)
vim.opt.fixendofline = true

-- ── Spelling ─────────────────────────────────────────────────────────────────
-- vim.opt.spell = true
-- vim.opt.spelllang = "en_us"

-- ── Clipboard ────────────────────────────────────────────────────────────────
-- Sync with system clipboard (works on Windows/WSL/Mac/Linux)
vim.opt.clipboard = "unnamedplus"

-- ── Python provider (skip if not needed, speeds up startup) ──────────────────
-- Comment these out if you want Neovim to auto-detect Python
-- vim.g.python3_host_prog = vim.fn.exepath("python3") ~= "" and vim.fn.exepath("python3") or vim.fn.exepath("python")

-- ── Disable unused providers ─────────────────────────────────────────────────
vim.g.loaded_perl_provider   = 0
vim.g.loaded_ruby_provider   = 0
vim.g.loaded_node_provider   = 0  -- LazyVim manages Node tools via Mason
