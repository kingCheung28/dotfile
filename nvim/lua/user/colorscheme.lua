local colorscheme = "catppuccin"
local ok, _ = pcall(require,colorscheme)
if not ok then
  vim.notify("colorscheme:" .. colorscheme .. " not found!")
  return
end

colorscheme = require('catppuccin')

colorscheme.setup {
    integrations = {
        bufferline = true,
        lsp_saga = true,
        -- indent_blankline = true,
        treesitter = true,
        telescope = true,
    }
}

colorscheme.load()
