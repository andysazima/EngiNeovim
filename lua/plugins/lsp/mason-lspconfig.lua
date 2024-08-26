return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
    },
    opts = true,
    config = function()
        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = {
                -- bash
                "bashls",
                -- python
                "basedpyright",
                "ruff",
                -- markdown/latex
                "texlab",
                "markdown_oxide",
                -- other
                "yamlls",
                "jsonls",
                "lua_ls",
                "matlab_ls",
                "perlnavigator",
            },
            handlers = {
                function(server)
                    lspconfig[server].setup({
                        capabilities = lsp_capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup {
                        capabilities = lsp_capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.4" },
                                diagnostics = {
                                    globals = { "vim" },
                                }
                            }
                        }
                    }
                end,
                ["ruff"] = function()
                    lspconfig.ruff.setup({
                        settings = {organizeImports = true}
                    })
                end,
            }
        })
    end
}
