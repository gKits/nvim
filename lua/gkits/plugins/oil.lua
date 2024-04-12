return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local oil = require("oil")

        oil.setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "size",
            },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}
