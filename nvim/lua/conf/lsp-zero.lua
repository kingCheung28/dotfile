local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
    vim.notify("lsp-zero not found!")
    return
end

lsp.preset('recommended')

lsp.ensure_installed({
    'clangd',
})

lsp.on_attach(function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopt = { noremap = true, silent = true, buffer = bufnr }
    local bind = vim.keymap.set

    bind('n', 'gd', "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", bufopt)
    bind('n', '<leader>lf', function() vim.lsp.buf.format({ async = true }) end, bufopt)

    -- Lspsaga
    bind('n', '<leader>rn', "<cmd>Lspsaga rename<CR>", bufopt) -- rename
    bind('n', '<leader>dj', '<cmd>Lspsaga diagnostic_jump_next<CR>', bufopt)
    bind('n', '<leader>dk', '<cmd>Lspsaga diagnostic_jump_prev<CR>', bufopt)
    bind('n', '<leader>k', "<cmd>Lspsaga hover_doc<CR>")
    bind('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', bufopt)
    bind('n', 'gh', "<cmd>Lspsaga peek_definition<CR>", bufopt)
end)

-- format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

local cmp = require('cmp')
local luasnip = require("luasnip")

local cmp_mappings = lsp.defaults.cmp_mappings({
    -- ['<leader>;'] = cmp.mapping.complete(),
        ['<C-j>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, { "i", "s" }),
        ['<C-k>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { "i", "s" })
})

lsp.setup_nvim_cmp({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'friendly_snippets' }
    },
    mapping = cmp_mappings,
    formatting = {
        format = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "..."
        })
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})
--[[
lsp.set_preferences {
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
}
--]]
lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = false,
})
