vim.lsp.config("dartls", {
  cmd = { "dart", "language-server", "--protocol=lsp" },

  root_dir = function(fname)
    return vim.fs.root(fname, {
      "pubspec.yaml",
      ".git",
    })
  end,

  capabilities = capabilities,

  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },

  init_options = {
    closingLabels = true,
    outline = true,
    flutterOutline = true,
  },

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function(args)
    vim.lsp.enable("dartls", { bufnr = args.buf })
  end,
})

