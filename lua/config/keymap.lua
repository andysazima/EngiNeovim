local g = vim.g
local map = vim.keymap.set

g.mapleader = " "
g.maplocalleader = "\\"

map("i", "jk", "<Esc>", {desc="escape from insert mode with 'jk' pressed in succession"})

map("n", "<C-h>", "<C-w>h", {desc="switch window left without the extra <C-w> press"})
map("n", "<C-j>", "<C-w>j", {desc="switch window down without the extra <C-w> press"})
map("n", "<C-k>", "<C-w>k", {desc="switch window up without the extra <C-w> press"})
map("n", "<C-l>", "<C-w>l", {desc="switch window right without the extra <C-w> press"})

map("n", "<leader>fe", "<cmd>Neotree toggle<CR>", {noremap = true, desc="Toggle Neotree"})
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {noremap = true, desc="Find files with Telescope"})
map("n", "<leader>fg", "<cmd>Telescope grep_string<CR>", {noremap = true, desc="Find files with Telescope"})

map("n", "<M-up>", "<cmd>m .-2<CR>==", {noremap = true})
map("n", "<M-down>", "<cmd>m .+1<CR>==", {noremap = true})

map("n", "<C-u>", "<C-u>zz", {noremap = true})
map("n", "<C-d>", "<C-d>zz", {noremap = true})

map("n", "<F2>", vim.lsp.buf.rename, {noremap = true})

