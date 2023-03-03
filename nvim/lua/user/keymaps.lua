local opt = {
  noremap = true,
  silent = true,
}
local bind = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

bind("n", "s", "", opt)

-- move
bind("n", "<C-a>", "0", opt)
bind("n", "<C-e>", "$", opt)
bind("v", "<C-a>", "0", opt)
bind("v", "<C-e>", "$", opt)
bind("n", "J", "5j", opt)
bind("n", "K", "5k", opt)
bind("v", "J", "5j", opt)
bind("v", "K", "5k", opt)

-- file
bind("n", "Q", ":q<CR>", opt)
bind("n", "S", ":w<CR>", opt)

-- split window
bind("n", "sl", ":set splitright<CR>:vsplit<CR>", opt)
bind("n", "sj", ":set nosplitright<CR>:vsplit<CR>", opt)
bind("n", "si", ":set nosplitbelow<CR>:split<CR>", opt)
bind("n", "sk", ":set splitbelow<CR>:split<CR>", opt)

-- window move
bind("n", "zj", "<C-w>h", opt)
bind("n", "zk", "<C-w>j", opt)
bind("n", "zi", "<C-w>k", opt)
bind("n", "zl", "<C-w>l", opt)

-- tab
bind("n", "tt", ":tabnew ", opt)
bind("n", "tl", ":tabnext<CR>", opt)
bind("n", "tj", ":tabNext<CR>", opt)

-- search
bind("n", "=", "nzz", opt)
bind("n", "-", "Nzz", opt)
bind("n", "<LEADER><CR>", ":nohlsearch<CR>", opt)
