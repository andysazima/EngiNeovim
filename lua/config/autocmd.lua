local augroup = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

local groupHighlightYank
au("textYankPost", {
    group = groupHighlightYank,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout=200,
        })
    end,
})
