local set = vim.opt

--vim.notify = require("notify")

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4
set.mouse = "a"
set.clipboard = "unnamedplus"

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = "utf-8"
set.termguicolors = true
set.background = "dark"

set.relativenumber = true
set.number = true
set.cursorline = true

set.hidden = true
set.completeopt = "menuone,noselect"

set.foldcolumn = "3"
set.foldlevel = 20
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

--require 'colorizer'.setup()

-- matrix theme settings
--vim.g.matrix_borders = true
--vim.g.matrix_disable_background = true
--vim.g.matrix_italic = false
--require('matrix').set()
--vim.cmd[[colorscheme matrix]]

-- gruvbox theme settings
--vim.cmd([[let g:gruvbox_material_background = 'hard']])
--vim.cmd([[let g:gruvbox_material_better_performance = 1]])
--vim.cmd([[let g:gruvbox_material_diagnostic_text_highlight = 1]])
--vim.cmd([[let g:gruvbox_transparent_background = 1]])
--vim.cmd([[let g:gruvbox_material_dim_inactive_windows = 0]])
--vim.cmd([[let g:gruvbox_material_diagnostic_virtual_text = 'colored']])
--vim.cmd([[colorscheme gruvbox-material]])
--vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
