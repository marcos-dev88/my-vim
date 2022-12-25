local ok, t = pcall(require, "telescope")
if not ok then
  return
end

local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }

t.setup{
    defaults = {
        prompt_prefix = "✖ ",
        selection_caret = "⇢ ",
        path_display = { "smart" },
    }
}

keymap('n', '<leader>f', '<cmd>Telescope find_files<CR>', noremap_opts)
