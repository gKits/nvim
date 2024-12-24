return {
    -- Rosepine theme
    "catppuccin/nvim",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            dim_inactive = {
                enabled = true,
            },
            styles = {
                strings = { "italic" }
            }
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
