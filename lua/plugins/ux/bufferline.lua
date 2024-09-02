return {
    "akinsho/bufferline.nvim",
    config = function()
        require("bufferline").setup({
            options = {
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        })
        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
        local map = vim.keymap.set
        map({ "n" }, "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
        map({ "n" }, "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete Non-Pinned Buffers" })
        map({ "n" }, "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Delete Other Buffers" })
        map({ "n" }, "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the Right" })
        map({ "n" }, "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete Buffers to the Left" })
        map({ "n" }, "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
        map({ "n" }, "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
        map({ "n" }, "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
        map({ "n" }, "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
        map({ "n" }, "[B", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer prev" })
        map({ "n" }, "]B", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer next" })
    end,
}
