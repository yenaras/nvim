return {
    "samirettali/shebang.nvim",
    lazy = false,
    config = function()
        vim.g.shebang_commands = {
            py = '/usr/bin/env python3',
            lua = '/usr/bin/env lua',
            sh = '/bin/sh'
        }
    end
}
