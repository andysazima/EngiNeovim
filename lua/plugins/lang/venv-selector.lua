return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
        require("venv-selector").setup({
            settings = {
                search = {
                    w87_venv = {
                        command = "fd python$ /usr/workspace/aeag/W87-0/.venv*/bin/"
                    },
                    fame_search = {
                        command = "fd python$ /collab/usr/gapps/fame/*venv*/bin"
                    }
                }
            }
        })
    end,
    keys = {
        { ",v", "<cmd>VenvSelect<cr>" },
    },
}
