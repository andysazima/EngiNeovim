return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter.configs")
        ts.setup {
            ensure_installed = { "bash", "python", "lua", "vim", "vimdoc", "latex", "markdown", "markdown_inline" },
            indent = {enable = true},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true
            }
        }
    end
}
