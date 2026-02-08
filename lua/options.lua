local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8

-- Behavior
opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300

-- Disable line numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

-- Disable netrw (recommended when using file explorers)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
