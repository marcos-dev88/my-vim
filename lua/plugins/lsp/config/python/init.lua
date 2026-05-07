vim.lsp.config("pylsp", {
    cmd = { "pylsp" },
    capabilities = capabilities,

    root_dir = function(fname)
        return vim.fs.root(fname, {
            "pyproject.toml",
            "requirements.txt",
            "setup.py",
            "setup.cfg",
            ".git",
        })
    end,

    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { "W391" },
                    maxLineLength = 100,
                },
                jedi_completion = {
                    fuzzy = true,
                },
                jedi_definition = {
                    enabled = true,
                },
                jedi_hover = {
                    enabled = true,
                },
            },
        },
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function(args)
        vim.lsp.enable("pylsp", { bufnr = args.buf })
    end,
})
