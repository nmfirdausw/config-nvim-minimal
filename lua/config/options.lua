-- Global options
-- Remap leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.border = "rounded"

-- Indentation and formatting
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- UI/UX
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.wrap = false
vim.opt.fillchars:append({ eob = " " })

-- Behavior
vim.opt.clipboard:append("unnamedplus")

-- History and backup
vim.opt.backup = false
vim.opt.confirm = true
vim.opt.history = 1000
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.writebackup = false
