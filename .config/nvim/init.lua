--options
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.expandtab = True
--maps
vim.g.mapleader = " "
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<leader>s', ':w<CR>')
vim.keymap.set('n', '<leader>q', ':qa!<CR>')
vim.keymap.set("n", "<Tab>", ">>",  opts)
vim.keymap.set("n", "<S-Tab>", "<<",  opts)
vim.keymap.set("v", "<Tab>", ">gv", opts)
vim.keymap.set("v", "<S-Tab>", "<gv", opts)
vim.keymap.set("i", "<S-Tab>", "<BS>", opts)
--load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
