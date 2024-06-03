return {
    "williamboman/mason.nvim",
    --event = "VeryLazy",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "jayp0521/mason-null-ls.nvim",
        "lvimuser/lsp-inlayhints.nvim",
        { "neovim/nvim-lspconfig", lazy = "VeryLazy" },
        "simrat39/rust-tools.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
        require("lsp-inlayhints").setup()



        local on_attach = function(client, bufnr)
            local function buf_set_keymap(...)
                ---@diagnostic disable-next-line: undefined-global
                vim.api.nvim_buf_set_keymap(bufnr, ...)
            end

            --            local function buf_set_option(...)
            --                ---@diagnostic disable-next-line: undefined-global
            --                vim.api.nvim_buf_set_option(bufnr, ...)
            --            end
            --
            --            buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

            --            local opts = { noremap = true, silent = true }

            --            buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)          --> jumps to the definition of the symbol under the cursor
            --            buf_set_keymap("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>", opts)       --> information about the symbol under the cursos in a floating window
            --            buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)      --> lists all the implementations for the symbol under the cursor in the quickfix window
            --            buf_set_keymap("n", "<leader>rn", ":lua vim.lsp.util.rename()<CR>", opts)     --> renaname old_fname to new_fname
            --            buf_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
            --            buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)          --> lists all the references to the symbl under the cursor in the quickfix window
            --            buf_set_keymap("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
            --            buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
            --            buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
            --            buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
            --            buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts) --> formats the current buffer
        end

        vim.api.nvim_create_augroup("LspAttach_inlayhints", {}) vim.api.nvim_create_autocmd("LspAttach", {
            group = "LspAttach_inlayhints",
            callback = function(args)
                if not (args.data and args.data.client_id) then
                    return
                end

                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                require("lsp-inlayhints").on_attach(client, bufnr)
            end,
        })

        local rt = require("rust-tools")

        rt.setup({
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
        })
        ---@diagnostic disable-next-line: undefined-global
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)


        require("mason-lspconfig").setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function(server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            ["rust_analyzer"] = function()
                require("rust-tools").setup {}
                require("lspconfig")["rust_analyzer"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end
        }
        require("lspconfig").lua_ls.setup {
            settings = {
                Lua = {
                    workspace = {
                        preloadFileSize = 10000
                    }
                }
            }
        }
    end,
}
