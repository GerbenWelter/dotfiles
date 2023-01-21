local options = {
  undofile = true,                  -- enable persistent undo
  pastetoggle = "<F4>",             -- Use F4 to toggle paste mode
  mouse = "a",                      -- enable mouse
  expandtab = true,                 -- convert tabs to spaces
  shiftwidth = 4,                   -- the number of spaces inserted for each indentation
  tabstop = 4,                      -- insert 4 spaces for a tab
  number = true,                    -- set numbered lines
  relativenumber = false,           -- set relative numbered lines
  termguicolors = true,             -- set term gui colors (most terminals support this)
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Don't source vim files
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")  -- separate vim plugins from neovim in case vim still in use

-- Set annoying trailing whitespace color
vim.g.better_whitespace_ctermcolor = 'magenta'
vim.g.better_whitespace_guicolor = 'magenta'

vim.o.showtabline = 2
vim.o.signcolumn = "yes:1"

