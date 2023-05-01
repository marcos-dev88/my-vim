local cmd = vim.cmd
require("config.vim_conf")
require("config.maps")
require("plugins")
require("colors")

cmd([[
    :colorscheme onedark
    :hi NormalFloat ctermfg=White ctermbg=233 guifg=#3a3a3a "rbg=58,58,58
]])

