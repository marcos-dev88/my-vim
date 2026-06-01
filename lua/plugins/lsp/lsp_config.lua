-- helper
local has_any_words_before = function()
  if vim.bo.buftype == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
  return col ~= 0 and text:sub(col, col):match("%s") == nil
end

-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- ======================
-- LSPs
-- ======================

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "lua", "python", "go", "rust", "c", "cpp", "java", "zig" },
  callback = function(args)
    vim.lsp.enable("tabby", { bufnr = args.buf })
  end,
})

-- signature
require("lsp_signature").setup({
  bind = true,
  handler_opts = {
    border = "rounded",
  },
  hint_enable = false, -- evita spam
  floating_window = true,
  floating_window_above_cur_line = true,
  fix_pos = false,
  max_height = 12,
  max_width = 80,
  transparency = nil,
  toggle_key = "<C-k>",
})

vim.o.completeopt = "menuone,noselect"

-- ======================
-- CMP
-- ======================

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("plugins.lsp.lspkind")

local select_opts = { behavior = cmp.SelectBehavior.Select }

local source_mapping = {
  buffer = "󱦟 [Buffer]",
  nvim_lsp = " [LSP]",
  nvim_lua = " [Lua]",
  path = "󰴠 [Path]",
  luasnip = " [LuaSnip]",
}

cmp.setup({
  window = {
    documentation = cmp.config.window.bordered({
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
    }),
  },

  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
    ["<Down>"] = cmp.mapping.select_next_item(select_opts),

    ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
    ["<C-n>"] = cmp.mapping.select_next_item(select_opts),

    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),

    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),

    ["<C-f>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-b>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_any_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-Space>"] = cmp.mapping.complete(),
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.codicons[vim_item.kind] or vim_item.kind
      vim_item.menu = source_mapping[entry.source.name] or entry.source.name
      return vim_item
    end,
  },
})

-- snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- format on save (fixed)
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local clients = vim.lsp.get_clients({
      bufnr = args.buf,
    })

    local has_formatter = vim.tbl_filter(function(client)
      return client.server_capabilities.documentFormattingProvider
    end, clients)

    if #has_formatter > 0 then
      vim.lsp.buf.format({
        bufnr = args.buf,
        async = false,
      })
    end
  end,
})
-- ======================
-- LSPs by language
-- ======================
require("plugins.lsp.config.c")
require("plugins.lsp.config.golang")
require("plugins.lsp.config.rust")
require("plugins.lsp.config.js")
require("plugins.lsp.config.flutter")
require("plugins.lsp.config.python")
require("plugins.lsp.config.zig")
require("plugins.lsp.config.v")

