return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { 'j-hui/fidget.nvim', opts = {}, tag = 'legacy' },

        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
    },

    config = function()
        require('neodev').setup()

        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup()

        mason_lspconfig.setup {
            ensure_installed = {
                "gopls",
                "dockerls",
                "docker_compose_language_service",
                "lua_ls",
            },

            automatic_installation = true
        }

        mason_tool_installer.setup({
            ensure_installed = {
                "gofumpt",
                "goimports",
                "delve",
                "golangci-lint",
                "jsonlint"
            }
        })
    end
}
