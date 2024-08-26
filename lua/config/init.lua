-- THE ORDER HERE MATTERS
-- 1. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- 2. load keymaps and settings before loading lazy
require("config.set")
require("config.keymap")

-- 3. Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins.ux" },
        { import = "plugins.lsp" },
        { import = "plugins.lang" },
        { import = "plugins.colors" },
    },
    install = { colorscheme = { "gruvbox" } },
    checker = { enabled = true },
})

-- 4. load autocommands after all plugins, sets, keymaps, etc. are loaded
require("config.autocmd")

-- 5. set initial colorscheme here
vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- 6. set some other keymaps after lazy loading
vim.keymap.set("n", "<leader>a", require("lspimport").import, { noremap = true })
