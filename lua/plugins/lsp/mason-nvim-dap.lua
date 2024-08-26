return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "mfussenegger/nvim-dap",
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason-nvim-dap").setup({
            ensure_installed = {"python", "bash"},
        })
    end
}
