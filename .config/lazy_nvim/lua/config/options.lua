-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.laststatus = 0 -- to fix issues with tmux integration
opt.clipboard = "" -- disable copying to clipboard
opt.shiftwidth = 2
opt.tabstop = 2
opt.relativenumber = true
