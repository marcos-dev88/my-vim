-- intial config
local opt = vim.opt
local g = vim.g

g.mapleader = ","
-- making python3 uses python only, if your python is already 'python3' comment the line below:
g.python3_host_prog = "/usr/bin/python"
g.nowritebackup = true
g.transparent_enabled = true

opt.guifont = { "JetBrains Mono Regular", "h12" }
opt.number = true
opt.relativenumber = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smarttab = true
opt.updatetime = 100
opt.scrolloff = 10
opt.cmdheight = 2
opt.encoding = 'utf-8'
opt.autoread = true
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.listchars:append("trail:-")
opt.foldmethod = "indent"
opt.foldnestmax = 10
opt.foldenable = false
opt.foldlevel = 2
opt.backspace = { "indent", "eol", "start" }
opt.sessionoptions:append("globals")
