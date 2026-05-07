vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=never",
    },

    -- O root_dir usando a API nova do 0.12
    root_dir = function(fname)
        return vim.fs.root(fname, {
            "compile_commands.json",
            "compile_flags.txt",
            "CMakeLists.txt",
            "Makefile",
            ".git",
        })
    end,

    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "objc", "objcpp" },
    callback = function(args)
        vim.lsp.enable("clangd", { bufnr = args.buf })
    end,
})
