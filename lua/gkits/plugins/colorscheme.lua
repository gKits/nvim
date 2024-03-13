return {
    -- Rosepine theme
    "rose-pine/neovim",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "rose-pine-moon"
    end,
}
