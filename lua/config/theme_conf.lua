local cmd = vim.cmd

-- :hi NormalFloat ctermfg=White ctermbg=233 guifg=#3a3a3a "rbg=58,58,58
cmd([[
    :colorscheme kanagawa-wave

    :highlight GitSignsAdd guibg=none
    :highlight GitSignsChange guibg=none
    :highlight GitSignsDelete guibg=none
    :highlight DiagnosticSignError guibg=none
    :highlight DiagnosticSignWarn guibg=none
    :highlight DiagnosticSignInfo guibg=none
    :highlight DiagnosticSignHint guibg=none
]])
