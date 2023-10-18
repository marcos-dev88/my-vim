nvim_lsp = require "lspconfig"

local home_dir = os.getenv("HOME")

vim.cmd([[au BufNewFile,BufRead *.v set filetype=vlang]])

nvim_lsp.vls.setup{
    cmd = { home_dir..".vls/bin/vls_linux_x64", "--socket" },
    -- settings = {
    --   vls = {
    --     analyses = {
    --       unusedparams = true,
    --     },
    --     staticcheck = true,
    --   },
    -- },
}

