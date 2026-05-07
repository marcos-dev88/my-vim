local capabilities = vim.lsp.protocol.make_client_capabilities()
if pcall(require, "cmp_nvim_lsp") then
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end

vim.lsp.config("rust_analyzer", {
    cmd = {
        (os.getenv("RUSTBIN") and (os.getenv("RUSTBIN") .. "/rust-analyzer"))
        or "rust-analyzer",
    },
    capabilities = capabilities,
    -- Importante: root_dir precisa retornar um caminho absoluto ou nil
    root_dir = vim.fs.root(0, { "Cargo.toml", ".git" }),
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true, buildScripts = { enable = true } },
            checkOnSave = true,
            procMacro = { enable = true },
            inlayHints = {
                lifetimeElisionHints = { enable = "always", useParameterNames = true },
            },
        },
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function(args)
        vim.lsp.enable("rust_analyzer", { bufnr = args.buf })
    end,
})
