local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local groupHighlightYank = augroup("groupHighlightYank", {})
autocmd({"TextYankPost"}, {
    group = groupHighlightYank,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout=200,
        })
    end
})

local groupRemoveWhiteSpace = augroup("groupRemoveWhiteSpace", {})
autocmd({"BufWritePre"}, {
    group = groupRemoveWhiteSpace,
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd [[%s/\s\+$//e]] end)
        vim.fn.setpos(".", save_cursor)
    end,
})

