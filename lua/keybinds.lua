vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>vn', ':vert new<CR>:Ex<CR>')
vim.keymap.set('n', '<leader>hn', ':hor new<CR>:Ex<CR>')
--vim.keymap.set('i', 'jj', '<Esc>')

-- Set window width quickly
vim.keymap.set('n', '<leader>6', '65<C-w>|')
vim.keymap.set('n', '<leader>7', '75<C-w>|')
vim.keymap.set('n', '<leader>8', '85<C-w>|')
vim.keymap.set('n', '<leader>9', '95<C-w>|')
vim.keymap.set('n', '<leader>10', '105<C-w>|')
vim.keymap.set('n', '<leader>no', ':noh<CR>')

-- Custom Shit for LSP and cmp
-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
--vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
--vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
--vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

-- Remove binds
-- -- Remove "CTRL-W, Q" from closing the active window, I was hitting this all
-- -- the time.
vim.keymap.set('n', '<C-w>q', '<nop>')

-- Make "CTRL-C" behave the exact same as <esc>, makes the LSP diagnostics not
-- disappear. I use CTRL-C almost exclusively and this bugged me.
vim.keymap.set({'n', 'v', 'i'}, '<C-c>', '<esc>')

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end
})

