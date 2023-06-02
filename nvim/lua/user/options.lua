local options = {
    backup = false,         -- creates a backup file
    clipboard = "unnamed",  -- allows neovim to access the system clipboard
    cmdheight = 1,          -- keep status bar position close to bottom
    encoding = "utf-8",
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true,        -- highlight all matches on previous search pattern
    incsearch = true,       -- 边输入边搜索
    ignorecase = true,      -- ignore case in search patterns
    mouse = "a",            -- allow the mouse to be used in neovim
    pumheight = 10,         -- pop up menu height
    showtabline = 2,        -- always show tabs
    smartcase = true,       -- smart case
    smartindent = true,     -- make indenting smarter again
    splitbelow = true,      -- force all horizontal splits to go below current window
    splitright = true,      -- force all vertical splits to go to the right of current window
    swapfile = false,       -- creates a swapfile
    termguicolors = true,   -- set term gui colors (most terminals support this)
    timeoutlen = 500,       -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,        -- enable persistent undo
    updatetime = 300,       -- faster completion (4000ms default)
    writebackup = false,    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,       -- convert tabs to spaces
    shiftwidth = 4,         -- the number of spaces inserted for each indentation
    tabstop = 4,            -- insert 2 spaces for a tab
    cursorline = true,      -- highlight the current line
    number = true,          -- set numbered lines
    relativenumber = false, -- set relative numbered lines
    numberwidth = 4,        -- set number column width to 2 {default 4}
    signcolumn = "yes",     -- always show the sign column, otherwise it would shift the text each time
    wrap = false,           -- display lines as one long line
    scrolloff = 8,          -- keep 8 height offset from above and bottom
    sidescrolloff = 8,      -- keep 8 width offset from left and right
    list = false,
    wildmenu = true,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
-- WSL yank support
vim.cmd [[
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
]]
