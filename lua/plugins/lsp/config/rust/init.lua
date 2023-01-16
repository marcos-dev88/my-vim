nvim_lsp = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client)
    require'completion'.on_attach(client)
end

local my_rust_bin = os.getenv("RUSTBIN")

nvim_lsp.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                  locationLinks = false,
                  lifetimeElisionHints = {
                    enable = true,
                    useParameterNames = true
                  },
            },
            cargo = { loadOutDirsFromCheck = true },
            procMacro = { enable = true },
             imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        },
    },
}

local opts = {
  -- rust-tools options
  tools = {
    autoSetHints = true,
    rust_hover_actions = true,
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
      },
    },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
  -- https://rust-analyzer.github.io/manual.html#features

  server = {
   cmd = { my_rust_bin .. '/rust-analyzer' },
   cmd_env = { OPENSSL_DIR = '/usr/local/ssl' },    
   settings = {
      ["rust-analyzer"] = {
        assist = {
          importEnforceGranularity = true,
          importPrefix = "crate"
          },
        cargo = {
          allFeatures = true
          },
        checkOnSave = {
          -- default: `cargo check`
          command = "clippy"
          },
        },
        inlayHints = {
          locationLinks = false,
          lifetimeElisionHints = {
            enable = true,
            useParameterNames = true
          },
        },
      }
    },
}

require('rust-tools').setup(opts)
