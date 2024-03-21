return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")
        local sniploader = require("luasnip.loaders.from_snipmate")

        sniploader.lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })

        vim.keymap.set({ "i", "s" }, "C-L", function()
            luasnip.jump(1)
        end)
        vim.keymap.set({ "i", "s" }, "C-H", function()
            luasnip.jump(-1)
        end)
        vim.keymap.set({ "i", "s" }, "C-E", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end)
    end,
}
