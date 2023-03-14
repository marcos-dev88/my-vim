local cmd = vim.cmd
require("config.vim_conf")
require("config.maps")
require("plugins")
require("config.lsp_icons")

cmd([[
    :colorscheme purify
    :hi NormalFloat ctermfg=White
]])
