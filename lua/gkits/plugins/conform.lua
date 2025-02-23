return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters = {
                golines = {
                    command = "golines",
                    args = { "-m", "100", "--shorten-comments" }
                },
            },
            formatters_by_ft = {
                go = { "gofumpt", "goimports", "golines" },
                templ = { "goimports", "templ" },
                lua = { "stylua" },
                json = { "prettierd" },
                python = { "ruff" },
                html = { "prettierd" },
                markdown = { "prettierd" },
                yaml = { "prettierd" },
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
