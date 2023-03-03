local bind = vim.keymap.set

bind('n', '<leader>w', '<cmd>w<cr>')

-- NeoTree
-- H show hidden file
bind('n', '<leader>e', function()
  vim.cmd('NeoTreeFloatToggle')
end)
bind('n', '<leader>E', function()
  vim.cmd('NeoTreeFocusToggle')
end)

-- Telescope
bind('n', '<leader>ff', '<cmd>lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({ previewer = false, hidden = true, file_ignore_patterns = {".git", "vendor", "node_modules"} }))<cr>')
bind('n', '<leader>fb', '<cmd>Telescope git_branches<cr>')
bind('n', '<leader>fs', '<cmd>Telescope git_status<cr>')


