local ok, ts = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

ts.setup {
    ensure_installed = { "python", "cpp", "markdown", "markdown_inline" },
    auto_install = false,
    highlight = {
        enable = true,
    },

    autotag = {
        enable = true
    },

    textobjects = {
        select = {
            enable = true
        },
        swap = {
            enable = true
        }
    }
}
