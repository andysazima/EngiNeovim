return {
    "danymat/neogen",
    opts = true,
    keys = {
        {
            "<leader><leader>doc",
            function() require("neogen").generate() end,
            desc = "Add Docstring",
        },
    },
}
