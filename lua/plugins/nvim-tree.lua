return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    event = "VeryLazy",
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = { width = 30 },
            git = {
                ignore = false,
            },
        })
        local map = vim.keymap

        map.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
    end
}
