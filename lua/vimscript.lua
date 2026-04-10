-- Sets line numbers relative to the cursor. The cursor is still absolute line.
vim.cmd("set number relativenumber")

-- Highlights the line where the cursor is
vim.cmd("set cursorline")

-- Blinking Cursor
vim.cmd("set guicursor=a:blinkon5-blinkwait5-blinkoff5")

-- Set tabs to 4 spaces
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")

-- Scroll offset, how many lines of buffer space until a scroll happens.
vim.cmd("set scrolloff=10")

-- Sets color column at 80 columns.
vim.cmd("set cc=80")

-- Yanking and pasting from system clipboard
vim.cmd("set clipboard=unnamedplus")
