local home_dir = os.getenv("HOME")
local zls_bin_custom = home_dir .. "/zig/tools/zls/zig-out/bin/zls"

local function get_zls_bin()
    if vim.fn.executable(zls_bin_custom) == 1 then
        return zls_bin_custom
    end
    return "zls" 
end

vim.lsp.config("zls", {
    cmd = { get_zls_bin() },
    root_dir = vim.fs.root(0, { "build.zig", ".git" }),
    capabilities = zig_caps or vim.lsp.protocol.make_client_capabilities(),
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end,
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "zig",
    callback = function(args)
        vim.lsp.enable("zls", { bufnr = args.buf })
    end,
})
