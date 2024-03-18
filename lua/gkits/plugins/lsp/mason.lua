return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim", opts = {}, tag = "legacy" },

        -- Additional lua configuration, makes nvim stuff amazing!
        "folke/neodev.nvim",
    },

    config = function()
        require("neodev").setup()

        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "goimports",
                "delve",
                "golangci-lint",
                "jsonlint",
            },
        })
    end,
}
