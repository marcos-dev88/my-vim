vim.lsp.config("gopls", {
  cmd = { "gopls" },

  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },

      staticcheck = true,

      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})

vim.lsp.enable("gopls")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client and client.name == "gopls" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.code_action({
            context = {
              only = { "source.organizeImports" },
            },
            apply = true,
          })

          vim.lsp.buf.format({
            async = false,
          })
        end,
      })
    end
  end,
})
