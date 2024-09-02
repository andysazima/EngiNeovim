return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    config = function()
        -- vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "GruvboxRed" })
        require("dashboard").setup({
            theme = "hyper",
            shortcut_type = "number",
            config = {
                -- header = { "", "", "", "", "Iiiiiiiiiiit's Bobby Time", "", "" },
                week_header = { enable = true },
                shortcut = {
                    {
                        desc = "Edit Neovim Config ",
                        group = "GruvboxGreen",
                        key = "a",
                        icon = "  ",
                        action = "lua vim.cmd([[execute 'cd ' stdpath('config')]]) vim.cmd([[Telescope find_files]])",
                    },
                },
                footer = { "", "iiiiit's Bobby Time!" },
            },
        })
        -- open dashboard after closing lazy
        if vim.o.filetype == "lazy" then
            vim.api.nvim_create_autocmd("WinClosed", {
                pattern = tostring(vim.api.nvim_get_current_win()),
                once = true,
                callback = function()
                    vim.schedule(function()
                        vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
                    end)
                end,
            })
        end
    end,
}
