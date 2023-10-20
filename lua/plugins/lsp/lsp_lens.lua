local ok, lspl = pcall(require, 'lsp-lens')

if not ok then
    return
end

lspl.setup()
