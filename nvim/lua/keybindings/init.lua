vim.g.mapleader = ' '
-- macro for map to not write the long string
local map = vim.api.nvim_set_keymap

-- Moving in vim keybindings
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})
map('n', '<C-v>', '<C-w>v', {noremap = true, silent = false})
map('n', '<C-x>', '<C-w>s', {noremap = true, silent = false})

map('i', 'jk', '<ESC>', {noremap = true, silent = false})
map('i', 'kj', '<ESC>', {noremap = true, silent = false})

-- File manager(NerdTree)
map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<C-_>', ':call nerdcommenter#Comment(0, "toggle")<CR>', {noremap = true, silent = true})
map('v', '<C-_>', ':call nerdcommenter#Comment(0, "toggle")<CR>', {noremap = true, silent = true})

-- Telescope keybindings
map('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})
map('n', '<leader>fd', ':Telescope file_browser<CR>', {noremap = true, silent = true})
map('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true})
map('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true, silent = true})
map('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = true})
map('n', '<leader>fp', ':Telescope project<CR>', {noremap = true, silent = true})

-- In visual mode to move one tab to left or right(like VSCode)
map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

-- Floaterm(floating terminal) keybindings
map('n', '<leader>t', ':FloatermToggle --wintype=normal --height=6<CR>', {noremap = true, silent= true})
