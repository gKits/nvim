return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            settings = {
                save_on_toggle = true,
            }
        })

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end,
            { desc = "Add current buffer to harpoon list" })

        vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Open harpoon UI" })
    end
}
