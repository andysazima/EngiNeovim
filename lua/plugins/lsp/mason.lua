return {
    "williamboman/mason.nvim",
    dependencies = {
        "j-hui/fidget.nvim",
    },
    opts = true,
    config = function()
        require("fidget").setup({})
        require("mason").setup({})
    end
}
