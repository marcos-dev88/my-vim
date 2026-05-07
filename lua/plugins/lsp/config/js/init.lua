local capabilities = vim.lsp.protocol.make_client_capabilities()
if pcall(require, "cmp_nvim_lsp") then
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end

vim.lsp.config("eslint", {
    capabilities = capabilities,
    root_dir = function(fname)
        return vim.fs.root(fname, {
            ".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json", ".git"
        })
    end,
    on_attach = function(client, bufnr)
        client.server_capabilities.completionProvider = nil
        client.server_capabilities.hoverProvider = false

        local group = vim.api.nvim_create_augroup("EslintFix", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})

vim.lsp.config("ts_ls", {
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = capabilities,
    root_dir = function(fname)
        return vim.fs.root(fname, {
            "tsconfig.json", "jsconfig.json", "package.json", ".git"
        })
    end,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = { includeInlayParameterNameHints = "all" },
        },
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function(args)
        vim.lsp.enable("eslint", { bufnr = args.buf })
        vim.lsp.enable("ts_ls", { bufnr = args.buf })
    end,
})
