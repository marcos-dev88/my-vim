local lspconfig = require("lspconfig")

-- ESLint config
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

local function eslint_config_exists()
  local files = {".eslintrc.js", ".eslintrc.json", ".eslintrc", "package.json"}
  for _, file in ipairs(files) do
    if vim.fn.filereadable(vim.fn.getcwd() .. "/" .. file) == 1 then
      return true
    end
  end
  return false
end

local function set_lsp_config(client)
end

-- TSServer
lspconfig.tsserver.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    set_lsp_config(client)
  end,
}

-- EFM (lint + format)
lspconfig.efm.setup {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = true
    set_lsp_config(client)
  end,
  root_dir = function()
    if not eslint_config_exists() then return nil end
    return vim.fn.getcwd()
  end,
  settings = {
    languages = {
      javascript = { eslint },
      javascriptreact = { eslint },
      ["javascript.jsx"] = { eslint },
      typescript = { eslint },
      ["typescript.tsx"] = { eslint },
      typescriptreact = { eslint },
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
}
