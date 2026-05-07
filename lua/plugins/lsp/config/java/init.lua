local function setup_java()
  local jdtls = require("jdtls")
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  if pcall(require, "cmp_nvim_lsp") then
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  end

  local eclipse_java_google_style = os.getenv("ECLIPSE_JAVA_GOOGLE_STYLE")
  local jdtls_install_path = os.getenv("JDTLS_ECLIPSE_PATH")

  local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

  local root_dir = vim.fs.dirname(
    vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]
  )

  local on_attach = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = "auto" })
    jdtls.setup.add_commands()
    
  end

  local config = {
    cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xmx1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens", "java.base/java.util=ALL-UNNAMED",
      "--add-opens", "java.base/java.lang=ALL-UNNAMED",
      "-jar", jdtls_install_path .. "/plugins/org.eclipse.equinox.launcher.jar",
      "-configuration", jdtls_install_path .. "/config_linux",
      "-data", vim.fn.expand("~/.cache/jdtls-workspace/") .. workspace_dir,
    },

    root_dir = root_dir,
    capabilities = capabilities,
    on_attach = on_attach,

    settings = {
      java = {
        format = {
          settings = {
            url = eclipse_java_google_style,
            profile = "GoogleStyle",
          },
        },
        signatureHelp = { enabled = true },
        contentProvider = { preferred = "fernflower" },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
          },
        },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
        configuration = {
          runtimes = {
            { name = "JavaSE-17", path = "/usr/lib/jvm/java-17-openjdk/" },
            { name = "JavaSE-1.8", path = "/usr/lib/jvm/java-8-openjdk/" },
          },
        },
      },
    },
  }

  jdtls.start_or_attach(config)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    setup_java()
  end,
})
