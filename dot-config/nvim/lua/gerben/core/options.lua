-- Let neovim use its own virtual env
vim.g.python3_host_prog = vim.fn.expand("~/venv/neovim/bin/python")

-- Recommended session options
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set colorscheme
vim.o.termguicolors = true

-- Set tabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Disable word wrap
vim.o.wrap = false

-- Enable mouse mode
vim.o.mouse = "a"

-- Split vertically to the right
vim.o.splitright = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set cursor line options
vim.wo.cursorline = true
-- vim.wo.cursorlineopt = "number"

-- Start scrolling before end of screen
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Don't show keystrokes in CmdLine
vim.opt.showcmd = false

-- Set indent keys
vim.opt.indentkeys = "!^F,o,O,0#,0},0],<:>"

vim.o.winborder = "rounded"
