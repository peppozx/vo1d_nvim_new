vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':q<CR>')

require("config.lazy").setup()
require("config.keymaps").setup()
require("config.lsp").setup()
require("config.copilot").setup()

-- Hide default line bar from neovim - Using lualine
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.cmdheight = 1
