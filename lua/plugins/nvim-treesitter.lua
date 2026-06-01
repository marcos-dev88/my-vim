local tsitter = require("nvim-treesitter.config")

tsitter.setup({
  ensure_installed = {
    "c",
    "cpp",
    "lua",
    "go",
    "rust",
    "bash",
    "query",
    "vim",
    "markdown",
    "toml",
    "json",
    "yaml",
    "javascript",
    "typescript",
    "java",
    "zig",
    "python",
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function(args)
    if vim.bo[args.buf].buftype == "" then
      pcall(vim.treesitter.start, args.buf)
    end
  end,
})
