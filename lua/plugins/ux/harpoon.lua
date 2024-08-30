return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        -- basic telescope configuration
        local function toggle_telescope(harpoon_files)
            local finder = function()
                local paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(paths, item.value)
                end

                return require("telescope.finders").new_table({
                    results = paths,
                })
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = finder(),
                previewer = require("telescope.config").values.file_previewer({}),
                sorter = require("telescope.config").values.generic_sorter({}),
                layout_config = {
                    prompt_position = "top",
                },
                attach_mappings = function(prompt_bufnr, map)
                    map("i", "<C-d>", function()
                        local state = require("telescope.actions.state")
                        local selected_entry = state.get_selected_entry()
                        local current_picker = state.get_current_picker(prompt_bufnr)

                        table.remove(harpoon_files.items, selected_entry.index)
                        current_picker:refresh(finder())
                    end)
                    return true
                end,
            }):find()
        end
        -- set mappings
        local map = vim.keymap.set

        map("n", "<leader>he", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoon window" })

        -- map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        map("n", "<leader>ha", function() harpoon:list():add() end)

        map("n", "<leader>h1", function() harpoon:list():select(1) end)
        map("n", "<leader>h2", function() harpoon:list():select(2) end)
        map("n", "<leader>h3", function() harpoon:list():select(3) end)
        map("n", "<leader>h4", function() harpoon:list():select(4) end)
        map("n", "<leader>h5", function() harpoon:list():select(5) end)
        map("n", "<leader>h6", function() harpoon:list():select(6) end)
    end
}
