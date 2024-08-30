local g = vim.g
local set = vim.opt

set.compatible = false
set.relativenumber = true
set.number = true
set.belloff = "all"

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.shiftround = true
set.scrolloff = 8
set.smartindent = true
set.autoindent = true
set.autoread = true

set.sessionoptions = "resize,winpos,winsize,tabpages,folds,blank,buffers,help,options"
set.tabpagemax = 1000

set.wrap = true
set.linebreak = true
set.list = false
set.wrapmargin = 0
set.cursorline = true

set.ruler = true
set.fileformats = "unix,dos"
set.backup = false

set.incsearch = true
set.hlsearch = false
set.smartcase = true
set.termguicolors = true

set.signcolumn = "yes"

set.title = true
set.titlestring = "%F"

-- VimTeX
g.vimtex_view_general_viewer = "okular"
g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"

-- Python
g.python3_host_prog = os.getenv("HOME") .. "/.local/venv/nvim/bin/python3"

