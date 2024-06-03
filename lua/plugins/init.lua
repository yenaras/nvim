-- any plugins that don't require config
return {
    { "christoomey/vim-tmux-navigator", event = "VeryLazy" },
    { "NvChad/nvim-colorizer.lua",      event = "VeryLazy", config = true },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        ---@diagnostic disable-next-line: undefined-global
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = true },
}
