local opt = {
  noremap = true,
  silent = true,
}
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "


map("n", "s", "", opt)

-- move
map("n", "<C-a>", "0", opt)
map("n", "<C-e>", "$", opt)
map("v", "<C-a>", "0", opt)
map("v", "<C-e>", "$", opt)
map("n", "J", "5j", opt)
map("n", "K", "5k", opt)

-- file
map("n", "Q", ":q<CR>", opt)
map("n", "S", ":w<CR>", opt)

-- split window
map("n", "sl", ":set splitright<CR>:vsplit<CR>", opt)
map("n", "sj", ":set nosplitright<CR>:vsplit<CR>", opt)
map("n", "si", ":set nosplitbelow<CR>:split<CR>", opt)
map("n", "sk", ":set splitbelow<CR>:split<CR>", opt)

-- window move
map("n", "zj", "<C-w>h", opt)
map("n", "zk", "<C-w>j", opt)
map("n", "zi", "<C-w>k", opt)
map("n", "zl", "<C-w>l", opt)

-- tab
map("n", "tt", ":tabnew ", opt)
map("n", "tl", ":tabnext<CR>", opt)
map("n", "tj", ":tabNext<CR>", opt)

-- search
map("n", "=", "nzz", opt)
map("n", "-", "Nzz", opt)
map("n", "<LEADER><CR>", ":nohlsearch<CR>", opt)
