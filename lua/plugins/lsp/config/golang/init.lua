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
