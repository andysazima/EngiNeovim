return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
        })

        local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', {clear = true})

        vim.api.nvim_create_autocmd('LspAttach', {
            group = lsp_cmds,
            desc = 'LSP actions',
            callback = function()
                local bufmap = function(mode, lhs, rhs)
                    vim.keymap.set(mode, lhs, rhs, {buffer = true})
                end

                bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
                bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
                bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
                bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
                bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
                bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
                bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
                bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
                bufmap({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
                bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
                bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
                bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
                bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
            end
        })

        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("fidget").setup({})
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
            }
        })
    end
}
