-- intial config
-- vim.bo.filetype
-- vim.bo.filetype.plugin
vim.cmd([[ set sessionoptions+=globals ]])
vim.cmd([[ set listchars+=trail:- ]])
vim.g.guifont = true
vim.g.number = true
vim.bo.smartindent = true
vim.bo.expandtab = true
vim.g.updatetime = 100
vim.g.scrolloff =10
vim.g.cmdheight =2
vim.g.encoding = 'utf-8'
vim.g.nobackup = true
vim.g.nowritebackup = true
vim.g.autoread = true
vim.g.transparent_enabled = true

-- tab config 
vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.tabstop = 4
vim.g.smarttab = true

-- making python3 uses python only, if your python is already 'python3' comment the line below:
vim.g.python3_host_prog = "/usr/bin/python"

