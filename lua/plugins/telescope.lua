local ok, t = pcall(require, "telescope")
if not ok then
  return
end

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
        prompt_prefix = "✖ ",
        selection_caret = "⇢ ",
        path_display = { "smart" },
        file_ignore_patterns = ignore_folders_tls,
    }
}

keymap('n', '<leader>f', '<cmd>Telescope find_files hidden=true<CR>', noremap_opts)
