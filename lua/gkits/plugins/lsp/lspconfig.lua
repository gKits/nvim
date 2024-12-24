local function setup_lsp(lspconfig, capabilities, on_attach)
    -- Ansible
    lspconfig.ansiblels.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    -- Docker
    lspconfig.dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    -- Gitlab
    lspconfig.gitlab_ci_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    -- Go
    lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            gopls = {
                usePlaceholders = false,
                buildFlags = { "-tags=benchmark" },
                gofumpt = true,
                ["local"] = "<repo>",
            },
        },
    })
    lspconfig.templ.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    -- HTML/CSS (Webdev)
    lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "templ" }
    })
    lspconfig.htmx.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "templ" }
    })
    lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "templ" }
    })
    -- Lua
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        }
    })
    -- OpenAPI
    lspconfig.spectral.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
    -- Python
    lspconfig.pylsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "nvim-telescope/telescope.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },

    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local telescope = require("telescope.builtin")
        local capabilities = cmp_nvim_lsp.default_capabilities()
        local keymap = vim.keymap.set

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = "Run [c]ode [a]ction"
            keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

            opts.desc = "[g]o to [d]efinition"
            keymap("n", "gd", vim.lsp.buf.definition, opts)

            opts.desc = "go to declaration"
            keymap("n", "gD", vim.lsp.buf.definition, opts)

            opts.desc = "[l]ist [d]efinitions"
            keymap("n", "<leader>ld", telescope.lsp_definitions, opts)

            opts.desc = "[l]ist [r]eferences"
            keymap("n", "<leader>lr", telescope.lsp_references, opts)

            opts.desc = "Show [d]ocument [s]ymbols"
            keymap("n", "<leader>ds", telescope.lsp_document_symbols, opts)

            opts.desc = "[l]ist [i]mplementations"
            keymap("n", "<leader>li", telescope.lsp_implementations, opts)

            opts.desc = "Smart [r]e[n]ame"
            keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

            opts.desc = "Open floating diagnostics message"
            keymap("n", "<leader>e", vim.diagnostic.open_float, opts)

            opts.desc = "Show line diagnostics"
            keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

            opts.desc = "Show documentation"
            keymap("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "[r]e[s]tart [ls]p"
            keymap("n", "<leader>rsls", "<cmd>LspRestart<CR>", opts)

            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "go to previous diagnostic message" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "go to next diagnostic message" })
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "open floating diagnostic message" })
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostics list" })
        end

        setup_lsp(lspconfig, capabilities, on_attach)
    end,
}
