local function CodeRunner()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cpp",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<leader>r",
                -- "<ESC>:w<CR>:split<CR>:res -15<CR>:te g++ -std=c++20 -Wall -o %:t:r.out %  && ./%:t:r.out<CR>",
                "<ESC>:w<CR>:vsplit<CR>:res <CR>:te g++ -std=c++20 -Wall -o %:t:r.out %  && ./%:t:r.out<CR>",

                { silent = true, noremap = true }
            )
        end,
    })
end
CodeRunner()
