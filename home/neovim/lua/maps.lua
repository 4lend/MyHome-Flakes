local map = vim.api.nvim_set_keymap
vim.g.mapleader = "<C>"

default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

map("n", "<Space>", "<NOP>", default_options)

map("n", "<C-s>", "<cmd>Telescope find_files<CR>", {noremap = true})
map("n", "<C-x>", "<cmd>write<CR>", {noremap = true})
map("n", "<C-t>", "<cmd>Telescope buffers<CR>", {noremap = true})
map("n", "<C-g>", "<cmd>NvimTreeToggle<CR>", {noremap = true})
-- map("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", {noremap = true})
-- map("n", "K", "<cmd>Lspsaga hover_doc<CR>", {noremap = true})
-- map("n", "<C-k>", "<cmd>Lspsaga signature_help<CR>", {noremap = true})
-- map("n", "gh", "<cmd>Lspsaga Lspsaga lsp_finder<CR>", {noremap = true})

map("i", "jk", "<esc>", {noremap = true})
map("n", "<C-n>", "<cmd>colorscheme nordfox<CR>", {noremap = true})
map("n", "<C-m>", "<cmd>colorscheme nightfox<CR>", {noremap = true})
map('n', '<leader>h', ':help <C-r>=expand("<cword>")<CR><CR><C-w>_', { silent = true })

vim.cmd([[let g:floaterm_keymap_toggle = '<F12>']])


----- barbar.nvim -----
-- barbar.nvim maps configuration
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
