vim.g.mapleader = ' '

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Hide default line bar from neovim - Using lualine
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.cmdheight = 1

require("config.lazy").setup()
require("config.keymaps").setup()
require("config.lsp").setup()
require("config.copilot").setup()

vim.cmd("colorscheme retrobox")
