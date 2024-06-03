return {
    "sainnhe/gruvbox-material",
    priority = 1000,     -- load before any other plugin
    config = function()
        --load the color scheme here
        vim.cmd([[let g:gruvbox_material_background = 'hard']])
        vim.cmd([[let g:gruvbox_material_better_performance = 1]])
        vim.cmd([[let g:gruvbox_material_diagnostic_text_highlight = 1]])
        vim.cmd([[let g:gruvbox_transparent_background = 1]])
        vim.cmd([[let g:gruvbox_material_dim_inactive_windows = 0]])
        vim.cmd([[let g:gruvbox_material_diagnostic_virtual_text = 'colored']])
        vim.cmd([[colorscheme gruvbox-material]])
        vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
    end
}
