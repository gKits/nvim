return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- Adapters
        "nvim-neotest/neotest-go",
    },
    config = function()
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_tets = {
                format = function(diagnostic)
                    local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)

        local nt = require("neotest")

        require("neodev").setup({
            library = {
                plugins = { "neotest" },
                types = true,
            },
        })

        nt.setup({
            adapters = {
                require("neotest-go")({
                    experimental = {
                        test_table = true,
                    },
                    args = { "-count=1", "-timeout=60s" },
                }),
            },
        })

        vim.keymap.set("n", "<leader>tt", nt.run.run, { desc = "Run nearest test" })
        vim.keymap.set("n", "<leader>tw", nt.watch.toggle, { desc = "Toggle test watching" })
        vim.keymap.set(
            "n",
            "<leader>ta",
            "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
            { desc = "Run all tests in current file" }
        )
        vim.keymap.set(
            "n",
            "<leader>td",
            "<CMD>lua require('neotest').run.run({ strategy = 'dap' })<CR>",
            { desc = "Debug nearest test" }
        )
        vim.keymap.set("n", "<leader>to", "<CMD>Neotest output<CR>", { desc = "show test output" })
        vim.keymap.set("n", "<leader>tO", "<CMD>Neotest output-panel<CR>", { desc = "show test output panel" })
    end,
}
