if extension == "md" then
  require("plugins.lsp.tabnine")
else
  require("plugins.lsp.lsp_default")
end

require("plugins.lsp.diagnostics")
require("plugins.lsp.lsp_keymaps")
