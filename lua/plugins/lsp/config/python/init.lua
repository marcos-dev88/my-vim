nvim_lsp = require "lspconfig"

nvim_lsp.pylsp.setup{
  settings = {
    cmd = { "pylsp" },
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}
