local ok, t = pcall(require, "telescope")
if not ok then
  return
end

local t_grep_actions = require('telescope-live-grep-args.actions')
local builtin = require('telescope.builtin')
local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }
local ignore_folders_tls = {
    "node_modules/",
    "target/",
    "vendor",
    ".git/",
    ".idea",
    ".vscode"
}

t.setup{
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
                    ["<C-j>"] = t_grep_actions.quote_prompt({ postfix = " --iglob " }),
                }
            }
        }
    }
}


keymap('n', '<leader>f', '<cmd>Telescope find_files hidden=true<CR>', noremap_opts)
keymap('n', '<leader>s', "<cmd>Telescope live_grep_args<CR>", noremap_opts)

vim.keymap.set('n', 'ff', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', 'fr', function()
    local in_search = vim.fn.input("Find > ")
    local in_replace = vim.fn.input("Replace > ")

    vim.cmd(string.format([[ 
        :vimgrep /%s/gj **/* 
        set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
        %s
        :cfdo %s/%s/%s/gce | update ]], 
        in_search, "set grepformat=%f:%l:%c:%m", "%s", in_search, in_search
    ))
 
end)
