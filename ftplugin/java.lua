local config = require("plugins.lsp.config.java").jdtls_config()
local ok, jdtls = pcall(require, "jdtls")

if not ok then
  vim.notify("unable to load nvim-jdtls", "error")
  return
end

jdtls.start_or_attach(config)
