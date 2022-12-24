local cmd = vim.cmd
require("config.vim_conf")
require("config.maps")
require("plugins.plugin-pack")
require("plugins.complete")

cmd([[
    :colorscheme ayu
]])
