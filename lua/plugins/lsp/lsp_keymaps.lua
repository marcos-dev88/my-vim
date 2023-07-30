function keymap(rhs, lhs, bufopts, desc)
    bufopts.desc = desc
    vim.keymap.set("n", rhs, lhs, bufopts)
end


vim.api.nvim_create_autocmd("LspAttach", { 
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        
        if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        if client.server_capabilities.definitionProvider then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end

        local bufopts = { noremap=true, silent=true, buffer=bufnr }

        keymap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', bufopts, "Go to Declaration")
        keymap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts, "Go to Definition")
        keymap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts, "Hover text")
        keymap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts, "Go to Implementation")
        keymap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts, "Show signature")
        keymap('<leader>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufopts, "Go to Type definition")
        keymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts, "Show references")
        keymap('gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', bufopts, "Show line diagnostics")
        keymap('d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', bufopts, "Go to next diagnostic")
        keymap('d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', bufopts, "Go to prvious diagnostic")
        keymap('<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', bufopts, "List")
        keymap('<C-f>', '<cmd>lua vim.lsp.buf.format()<CR>', bufopts, "Formatting")
        keymap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', bufopts, "Add workspace folder")
        keymap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', bufopts, "Remove workspace folder")
        keymap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', bufopts, "List workspace folder")
        vim.keymap.set('v', "<leader>ca", "<ESC><CMD>lua vim.lsp.buf.code_action()<CR>", { noremap=true, silent=true, buffer=bufnr, desc = "Code actions" })
        keymap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', bufopts, "Code actions")
        keymap('<leader>lg', '<cmd>lua vim.lsp.diagnostic.formatting_sync(nil, 1000)<CR>', bufopts, "Format sync")
        keymap('<leader>lA', '<cmd>lua require(\'jdtls\').code_action()<CR>', bufopts, "JDTLS Code action")
    end,
})

