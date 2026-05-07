-- Tema
vim.cmd.colorscheme("catppuccin-macchiato")

-- Destaques sem fundo (útil para terminais transparentes)
local highlights = {
  GitSignsAdd = { bg = "NONE" },
  GitSignsChange = { bg = "NONE" },
  GitSignsDelete = { bg = "NONE" },
  DiagnosticSignError = { bg = "NONE" },
  DiagnosticSignWarn  = { bg = "NONE" },
  DiagnosticSignInfo  = { bg = "NONE" },
  DiagnosticSignHint  = { bg = "NONE" },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

