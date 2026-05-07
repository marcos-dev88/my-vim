local home_dir = os.getenv("HOME")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.zig",
  callback = function()
    vim.bo.filetype = "zig"
  end,
})

vim.lsp.config("zls", {
  cmd = { home_dir .. "/zig/tools/zls/zig-out/bin/zls" },

  -- O root_dir agora usando a API robusta do 0.12
  root_dir = function(fname)
    return vim.fs.root(fname, {
      "build.zig",
      "zls.json",
      ".git",
    })
  end,

  capabilities = capabilities,

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "zig",
  callback = function(args)
    vim.lsp.enable("zls", { bufnr = args.buf })
  end,
})
