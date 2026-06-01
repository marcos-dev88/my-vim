local telescope = require("telescope")
local builtin = require("telescope.builtin")
local t_grep_actions = require("telescope-live-grep-args.actions")

local ignore_folders_tls = {
  "node_modules/",
  "target/",
  "vendor",
  ".git/",
  ".idea",
  ".vscode",
}

telescope.setup({
  defaults = {
    prompt_prefix = "〉 ",
    selection_caret = "» ",
    path_display = { "smart" },
    file_ignore_patterns = ignore_folders_tls,
  },

  extensions = {
    live_grep_args = {
      auto_quoting = true,

      mappings = {
        i = {
          ["<C-k>"] = t_grep_actions.quote_prompt(),

          ["<C-j>"] = t_grep_actions.quote_prompt({
            postfix = " --iglob ",
          }),
        },
      },
    },
  },
})

telescope.load_extension("live_grep_args")

vim.keymap.set("n", "<leader>f", function()
  builtin.find_files({
    hidden = true,
  })
end)

vim.keymap.set("n", "<leader>s", function()
  telescope.extensions.live_grep_args.live_grep_args()
end)

vim.keymap.set("n", "ff", function()
  builtin.grep_string({
    search = vim.fn.input("Grep > "),
  })
end)

vim.keymap.set("n", "fr", function()
  local in_search = vim.fn.input("Find > ")
  local in_replace = vim.fn.input("Replace > ")

  vim.cmd(string.format([[
    vimgrep /%s/gj **/*
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%%f:%%l:%%c:%%m
    cfdo %%s/%s/%s/gce | update
  ]],
    in_search,
    in_search,
    in_replace
  ))
end)
