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
        local keymap = vim.keymap.set

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = "Run [c]ode [a]ction"
            keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

            opts.desc = "[g]o to [d]efinition"
            keymap("n", "<leader>gd", vim.lsp.buf.definition, opts)

            opts.desc = "[l]ist [d]efinitions"
            keymap("n", "<leader>ld", telescope.lsp_definitions, opts)

            opts.desc = "[l]ist [r]eferences"
            keymap("n", "<leader>lr", telescope.lsp_references, opts)

            opts.desc = "Show [d]ocument [s]ymbols"
            keymap("n", "<leader>ds", telescope.lsp_document_symbols, opts)

            opts.desc = "[g]o to [D]eclaration"
            keymap("n", "<leader>gD", vim.lsp.buf.definition, opts)

            opts.desc = "[l]ist [i]mplementations"
            keymap("n", "<leader>li", telescope.lsp_implementations, opts)

            opts.desc = "Smart [r]e[n]ame"
            keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

            opts.desc = "Open floating diagnostics message"
            keymap("n", "<leader>e", vim.diagnostic.open_float, opts)

            opts.desc = "Show line diagnostics"
            keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

            opts.desc = "Go next diagnostic"
            keymap("n", "]d", vim.diagnostic.goto_next, opts)

            opts.desc = "Go previous diagnostic"
            keymap("n", "[d", vim.diagnostic.goto_prev, opts)

            opts.desc = "Show documentation"
            keymap("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "[r]e[s]tart [ls]p"
            keymap("n", "<leader>rsls", "<cmd>LspRestart<CR>", opts)

            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig["lua_ls"].setup({
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
                        }
                    }
                }
            }
        })
    end
}
