local nvim_lsp = require "lspconfig"
local util = require('lspconfig/util')

local home_dir = os.getenv("HOME")

vim.cmd([[au BufNewFile,BufRead *.v set filetype=zig]])

nvim_lsp.zls.setup{
    filetypes = {"zig"},
    cmd = { home_dir.."/zig/tools/zls/zig-out/bin/zls" },
    root_dir = util.root_pattern("build.zig", ".git")
}
