return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        -- create lsp server
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
    end
}
