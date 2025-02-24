-- Set leader key
vim.g.mapleader = " "

-- Unmap space in normal and visual modes to prevent it from moving the cursor
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- activate number of line by default
vim.opt.number = true

-- automatically copy to clipboard
vim.opt.clipboard = "unnamedplus"

-- Disable line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
-- Set leader key
vim.g.mapleader = " "

-- Unmap space in normal and visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Neovim options
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.pumheight = 5
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Conceal level for Obsidian.nvim
vim.opt.conceallevel = 1

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Remove background color for Kitty transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Load Neovim options first
require("options")

-- Load plugins
local plugins = require("plugins.init")
require("lazy").setup(plugins)

-- Load key mappings
require("mappings")

-- Set default theme
vim.cmd("colorscheme rose-pine")

-- Disable default status bar (replaced by lualine)
vim.o.cmdheight = 0

-- Dashboard styling
vim.cmd([[
  highlight DashboardHeader guifg=#7E9CD8 ctermfg=75
  highlight DashboardButtons guifg=#A3D4D5 ctermfg=152
  highlight DashboardFooterBold guifg=#7E9CD8 gui=bold
]])
    vim.opt_local.relativenumber = false
  end,
})

-- Bootstrap lazy.nvim and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from plugins/init.lua
local plugins = require("plugins.init")

-- Setup lazy.nvim with the imported plugins
require("lazy").setup(plugins)

-- Load Neovim options (create your own options module)
require("options")

-- Load key mappings (create your own mappings module)
vim.schedule(function()
  require("mappings")
end)

-- Set default theme
vim.cmd("colorscheme rose-pine")

-- desactivate default nvim status bar (replaced with lualine plugin)
vim.o.cmdheight = 0

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Update Dashboard style
vim.cmd([[
  highlight DashboardHeader guifg=#7E9CD8 ctermfg=75
  highlight DashboardButtons guifg=#A3D4D5 ctermfg=152
  highlight DashboardFooterBold guifg=#7E9CD8 gui=bold
]])

vim.o.pumheight = 5

vim.opt.wrap = true
vim.opt.linebreak = true

-- remove background color, to apply kitty transparency
-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })

