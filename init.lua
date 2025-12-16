vim.g.mapleader = ' '

vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Hide default line bar from neovim - Using lualine
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.cmdheight = 1

require("config.lazy").setup()
require("config.keymaps").setup()
require("config.lsp").setup()
require("config.copilot").setup()

vim.cmd("colorscheme everforest")

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
end
