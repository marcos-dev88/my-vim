-- intial config
local opt = vim.opt
local g = vim.g
-- opt.filetype
-- opt.filetype.plugin
vim.cmd([[ 
    let mapleader = ","
    set listchars+=trail:-
    set sessionoptions+=globals
    set clipboard+=unnamedplus
    set mouse=a
    set foldmethod=indent   
    set foldnestmax=10
    set nofoldenable
    set foldlevel=2
]])

opt.guifont = { "JetBrains Mono", "h12" } 
opt.number = true
opt.smartindent = true
opt.expandtab = true
opt.updatetime = 100
opt.scrolloff = 10
opt.cmdheight = 2
opt.encoding = 'utf-8'
g.nowritebackup = true
opt.autoread = true
g.transparent_enabled = true

-- tab config 
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smarttab = true

-- making python3 uses python only, if your python is already 'python3' comment the line below:
g.python3_host_prog = "/usr/bin/python"

