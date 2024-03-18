return {
    "laytan/cloak.nvim",

    config = function()
        local cloak = require("cloak")
        -- cloak.setup({
        --     enabled = true,
        --     cloak_character = "*",
        --     highlight_group = "Comment",
        --     cloak_telescope = true,
        --     patterns = {
        --         file_pattern = ".env*",
        --         cloak_pattern = "=.+",
        --         replace = "[hidden] %1",
        --     },
        -- })
        cloak.setup({
            enabled = true,
            cloak_character = "*",
            highlight_group = "Comment",
            cloak_length = 8,
            try_all_patterns = true,
            cloak_telescope = true,
            patterns = {
                {
                    file_pattern = ".env*",
                    cloak_pattern = "=.+",
                    replace = nil,
                },
            },
        })

        vim.keymap.set("n", "<leader>eC", cloak.toggle, { desc = "[e]nable [C]loak" })
    end,
}
