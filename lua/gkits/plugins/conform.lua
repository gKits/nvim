return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                go = { "gofumpt", "goimports" },
                templ = { "goimports", "templ" },
                lua = { "stylua" },
                json = { "fixjson" },
                python = { "black" },
                html = { "prettier" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>ff", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "[f]ormat [f]ile or marked range (visual)" })
    end,
}
