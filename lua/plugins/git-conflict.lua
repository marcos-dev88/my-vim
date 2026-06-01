local git_conflict = require("git-conflict")

vim.api.nvim_set_hl(0, "ConflictIncoming", {
  bg = "red",
  fg = "black",
})

vim.api.nvim_set_hl(0, "ConflictCurrent", {
  bg = "blue",
  fg = "black",
})

git_conflict.setup({
  default_mappings = false,
  disable_diagnostics = false,

  highlights = {
    incoming = "ConflictIncoming",
    current = "ConflictCurrent",
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "GitConflictDetected",

  callback = function()
    vim.notify(
      "Conflict detected in " .. vim.fn.expand("<afile>")
    )
  end,
})

vim.keymap.set(
  "n",
  "co",
  "<cmd>GitConflictChooseOurs<CR>"
)

vim.keymap.set(
  "n",
  "ct",
  "<cmd>GitConflictChooseTheirs<CR>"
)

vim.keymap.set(
  "n",
  "cb",
  "<cmd>GitConflictChooseBoth<CR>"
)

vim.keymap.set(
  "n",
  "c0",
  "<cmd>GitConflictChooseNone<CR>"
)

vim.keymap.set(
  "n",
  "]x",
  "<cmd>GitConflictNextConflict<CR>"
)

vim.keymap.set(
  "n",
  "[x",
  "<cmd>GitConflictPrevConflict<CR>"
)
