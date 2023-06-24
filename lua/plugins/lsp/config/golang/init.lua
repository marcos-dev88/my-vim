nvim_lsp = require "lspconfig"

local my_go_bin = os.getenv("GOBIN")

nvim_lsp.gopls.setup {
    cmd = { my_go_bin .. "/gopls", "serve" },
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
