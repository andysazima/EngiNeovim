return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "jsonls",
                "ltex",
                "lua_ls",
                "matlab_ls",
                "perlnavigator",
                "ruff",
                "ruff_lsp",
                "yamlls",
            },
        })
    end


}
