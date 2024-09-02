local g = vim.g
local map = vim.keymap.set

g.mapleader = " "
g.maplocalleader = "\\"

-- A given
map("i", "jk", "<Esc>", { desc = "escape from insert mode with 'jk' pressed in succession" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left without the extra <C-w> press" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down without the extra <C-w> press" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up without the extra <C-w> press" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right without the extra <C-w> press" })

map("n", "<C-u>", "<C-u>zz", { noremap = true, desc = "Half page up also recenters text" })
map("n", "<C-d>", "<C-d>zz", { noremap = true, desc = "Half page down also recenters text" })

map("", "<F3>", "<cmd>e <cfile><CR>", { noremap = true, desc = "Open file under the cursor" })

map("n", "Q", "@q", { noremap = true, desc = "Quick macro activation for temporary macros (stored in register q)" })

map("n", "<leader>a", "za", { noremap = true, desc = "Easier fold toggle combo" })
map("n", "<leader>A", "zA", { noremap = true, desc = "Easier fold toggle combo" })
