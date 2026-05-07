local home_dir = os.getenv("HOME") or ""

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.v",
  callback = function()
    vim.bo.filetype = "vlang"
  end,
})

vim.lsp.config("vls", {
  cmd = { home_dir .. "/.vls/bin/vls_linux_x64", "--socket" },

  root_dir = function(fname)
    return vim.fs.root(fname, {
      "v.mod",
      ".git",
    })
  end,
  
  capabilities = capabilities,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "vlang",
  callback = function(args)
    vim.lsp.enable("vls", { bufnr = args.buf })
  end,
})

