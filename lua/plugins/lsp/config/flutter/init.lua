local lspconfig = require("lspconfig")

local function set_lsp_config(client)
end

lspconfig.dartls.setup({
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = true
    set_lsp_config(client)
  end,

  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
  init_options = {
    closingLabels = true,
    outline = true,
    flutterOutline = true,
  },
})

