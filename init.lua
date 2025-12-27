local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('mfussenegger/nvim-dap')

vim.call('plug#end')
require("vimscript")
require("remap")
require("plugins.lsp")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require("plugins.themes")

vim.cmd("colorscheme moonfly")
--vim.cmd("colorscheme modus_operandi")

require("luasnip.loaders.from_vscode").lazy_load()

