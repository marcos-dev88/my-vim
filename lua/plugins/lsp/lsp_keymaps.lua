local function keymap(mode, lhs, rhs, bufnr, desc)
  vim.keymap.set(mode, lhs, rhs, {
    noremap = true,
    silent = true,
    buffer = bufnr,
    desc = desc,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    -- omnifunc
    if client:supports_method("textDocument/completion") then
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end

    -- tagfunc
    if client:supports_method("textDocument/definition") then
      vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    end

    -- =========================
    -- LSP keymaps
    -- =========================

    keymap("n", "gD", vim.lsp.buf.declaration, bufnr, "Go to declaration")
    keymap("n", "gd", vim.lsp.buf.definition, bufnr, "Go to definition")
    keymap("n", "K", vim.lsp.buf.hover, bufnr, "Hover")
    keymap("n", "gi", vim.lsp.buf.implementation, bufnr, "Go to implementation")
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufnr, "Signature help")
    keymap("n", "<leader>td", vim.lsp.buf.type_definition, bufnr, "Type definition")
    keymap("n", "gr", vim.lsp.buf.references, bufnr, "References")

    -- diagnostics
    keymap("n", "gl", vim.diagnostic.open_float, bufnr, "Line diagnostics")
    keymap("n", "d]", vim.diagnostic.goto_next, bufnr, "Next diagnostic")
    keymap("n", "d[", vim.diagnostic.goto_prev, bufnr, "Previous diagnostic")
    keymap("n", "<leader>q", vim.diagnostic.setloclist, bufnr, "Diagnostics list")

    -- formatting
    keymap("n", "<C-f>", function()
      vim.lsp.buf.format({ async = true })
    end, bufnr, "Format")

    -- workspace
    keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufnr, "Add workspace folder")
    keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufnr, "Remove workspace folder")
    keymap("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufnr, "List workspace folders")

    -- code actions
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, bufnr, "Code action")
    keymap("v", "<leader>ca", vim.lsp.buf.code_action, bufnr, "Code action")

    -- rename
    keymap("n", "<leader>rn", vim.lsp.buf.rename, bufnr, "Rename")

    -- jdtls extra
    if client.name == "jdtls" then
      keymap("n", "<leader>lA", function()
        require("jdtls").code_action()
      end, bufnr, "JDTLS code action")
    end
  end,
})
