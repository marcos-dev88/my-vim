vim.lsp.config("gopls", {
  cmd = { "gopls" },

  root_dir = function(fname)
    return vim.fs.root(fname, {
      "go.mod",
      "go.work",
      ".git",
    })
  end,

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

  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod", "gowork", "gotmpl" },
  callback = function(args)
    vim.lsp.enable("gopls", { bufnr = args.buf })
  end,
})
