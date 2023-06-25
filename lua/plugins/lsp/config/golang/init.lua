nvim_lsp = require "lspconfig"

local go_bin = os.getenv("GOBIN")
local go_path = os.getenv("GOPATH")
local go_path_mod = go_path..'/pkg/mod'
local util = require('lspconfig/util')
local last_root_path = nil

if my_go_path == nil then
    my_go_path = ""
end

nvim_lsp.gopls.setup {
    cmd = { go_bin .. "/gopls", "serve" },
    root_dir = function(fname)
        local full_path = vim.fn.expand(fname, ':p')
        if string.find(full_path, go_path_mod) and last_root_path ~= nil then
            return last_root_path
        end
        last_root_path = util.root_pattern("go.mod", ".git")(fname)
        return last_root_path
    end,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})
