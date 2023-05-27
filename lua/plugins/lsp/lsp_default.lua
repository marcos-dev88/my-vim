local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require'lspconfig'.clangd.setup{}
require "lsp_signature".setup()
vim.o.completeopt = 'menuone,noselect'

local cmp = require'cmp'
local luasnip = require("luasnip")

local lspkind = require('plugins.lsp.lspkind')
local select_opts = {behavior = cmp.SelectBehavior.Select}

local source_mapping = {
    buffer = "󱦟 [Buffer]",
    nvim_lsp = " [LSP]",
    nvim_lua = " [Lua]",
    cmp_tabnine = " [Tabnine]",
    path = "󰴠 [Path]",
    luasnip = " [LuaSnip]"
}

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },
  window = {
    documentation = cmp.config.window.bordered({
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
    })
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.codicons[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ''
      end
      vim_item.menu = menu
      return vim_item
    end
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<C-Space>'] = cmp.mapping.complete(),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },      
})

-- cmp.config.window.bordered()

require("luasnip/loaders/from_vscode").load()

require "plugins.lsp.config.golang"
require "plugins.lsp.config.rust"
