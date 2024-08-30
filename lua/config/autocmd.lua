local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local set = vim.opt

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

local groupSetSyntax = augroup("groupSetSyntax", {})
autocmd({"BufNewFile", "BufRead"}, {
    group = groupSetSyntax,
    pattern = {"*.tg","*.part","*.lc","*.mtrl","*.key", "trugrdi"},
    callback = function()
        set.filetype = "ingrid"
    end
})
autocmd({"BufNewFile", "BufRead"}, {
    group = groupSetSyntax,
    pattern = {"*.assembly", "*.subassembly"},
    callback = function()
        set.filetype = "diablo"
    end
})

