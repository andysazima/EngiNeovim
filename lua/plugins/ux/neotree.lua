return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                hijack_netrw_behavior = "open_default",
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = {},
                },
            },
        })

        -- Keymaps
        local map = vim.keymap.set
        map("n", "<leader>fe", "<cmd>Neotree<CR>", { noremap = true, desc = "Turn on and focus on Neotree" })
        map("n", "<leader>te", "<cmd>Neotree toggle<CR>", { noremap = true, desc = "Toggle Neotree" })
        map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, desc = "Find files with Telescope" })
        map("n", "<leader>fg", "<cmd>Telescope grep_string<CR>", { noremap = true, desc = "Find files with Telescope" })
    end,
}
