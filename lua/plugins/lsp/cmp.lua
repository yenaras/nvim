return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",             -- snippet engine
        "rafamadriz/friendly-snippets", -- useful snippets
        "windwp/nvim-autopairs",
        { "tzachar/cmp-tabnine", build = "./install.sh", dependencies = "hrsh7th/nvim-cmp" },
    },
    config = function()
        vim.opt.completeopt = "menu,menuone,noselect"

        local luasnip = require("luasnip")

        local lspkind = require("lspkind")

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        local compare = require("cmp.config.compare")

        local cmp = require("cmp")
        -- load vs-code like snippets from plugins (e.g. friendly-snippets)
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = " " } }))
        cmp.setup({
            sorting = {
                priority_weight = 2,
                comparators = {
                    require("cmp_tabnine.compare"),
                    compare.offset,
                    compare.exact,
                    compare.score,
                    compare.recently_used,
                    compare.kind,
                    compare.sort_text,
                    compare.length,
                    compare.order,
                },
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<C-e>"] = cmp.mapping.close(),
                    -- Make enter work again by disable  
                ["<CR>"] = cmp.mapping.disable,
                ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                  else
                    fallback()
                  end
                end, {
                  "i",
                  "s",
                }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                  else
                    fallback()
                  end
                end, {
                  "i",
                  "s",
                }),
           },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "cmp_tabnine" },
                { name = "nvim_lsp_signature_help" },
            },
            formatting = {
                format = lspkind.cmp_format({
                    with_text = true, -- do not show text alongside icons
                    maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function(entry, vim_item)
                        return vim_item
                    end,
                }),
            },
        })
    end,
}
