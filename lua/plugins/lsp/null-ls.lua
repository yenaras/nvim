return {
    "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting

        local sources = {
        }

        null_ls.setup({
            sources = sources,

            on_attach = function(client)
                if client.resolved_capabilities.document_formatting then
                    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
                end
            end,
        })
    end,
}
