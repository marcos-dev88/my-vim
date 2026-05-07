local capabilities = vim.lsp.protocol.make_client_capabilities()
if pcall(require, "cmp_nvim_lsp") then
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end

vim.lsp.config("vtsls", {
    install = {
        cmd = { "vtsls", "--stdio" },
    },
    default_config = {
        cmd = { "vtsls", "--stdio" },
        capabilities = capabilities,
        root_dir = function(fname)
            return vim.fs.root(fname, { "tsconfig.json", "jsconfig.json", "package.json", ".git" })
        end,
        settings = {
            vtsls = {
                autoUseWorkspaceTsdk = true,
                experimental = { completion = { enableServerSideFuzzyMatch = true } },
            },
            typescript = {
                updateImportsOnFileMove = { enabled = "always" },
                suggest = { completeFunctionCalls = true },
                inlayHints = {
                    parameterNames = { enabled = "all" },
                    parameterTypes = { enabled = true },
                    variableTypes = { enabled = true },
                    functionLikeReturnTypes = { enabled = true },
                },
            },
        },
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            
            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
        end,
    }
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function(args)
        vim.lsp.enable("vtsls") 
    end,
})
