local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
    vim.notify("not found lazy!")
    return
end
require("lazy").setup({
    "catppuccin/nvim",
    name = "catppuccin",
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',       -- Required
            'williamboman/mason.nvim',     -- Optional
            'williamboman/mason-lspconfig.nvim', -- Optional
            'onsails/lspkind.nvim',
            -- Autocompletion
            'hrsh7th/nvim-cmp',       -- Required
            'hrsh7th/cmp-nvim-lsp',   -- Required
            'hrsh7th/cmp-buffer',     -- Optional
            'hrsh7th/cmp-path',       -- Optional
            'saadparwaiz1/cmp_luasnip', -- Optional
            'hrsh7th/cmp-nvim-lua',   -- Optional
            -- Snippets
            'L3MON4D3/LuaSnip',       -- Required
            'rafamadriz/friendly-snippets', -- Optional
            'hrsh7th/cmp-nvim-lsp-signature-help',
        }
    },
    { 'glepnir/lspsaga.nvim',  branch = 'main' },
    "nvim-treesitter/nvim-treesitter",
    "kyazdani42/nvim-web-devicons",
    "windwp/nvim-ts-autotag",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        }
    },
    "lukas-reineke/indent-blankline.nvim",
    "nvim-lualine/lualine.nvim",
    { "windwp/nvim-autopairs", config = true,  event = "InsertEnter" },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },
    "nvim-telescope/telescope-ui-select.nvim",
    "akinsho/bufferline.nvim",
    "numToStr/Comment.nvim",
    'voldikss/vim-floaterm',
})
