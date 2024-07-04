return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup({
            signs = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signs_staged = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            current_line_blame = true,
            word_diff = true,
            on_attach = function(bufnr)
                _ = bufnr

                vim.keymap.set("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, { desc = "goto next hunk" })
                vim.keymap.set("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, { desc = "goto previous hunk" })

                vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "stage hunk under cursor" })
                vim.keymap.set("v", "<leader>hs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "stage highlighted hunk" })

                vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "stage hunk under cursor" })
                vim.keymap.set("v", "<leader>hr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "reset highlighted hunk" })

                vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "unstage hunk under cursor" })

                vim.keymap.set("n", "<leader>hp", gitsigns.stage_hunk, { desc = "preview hunk under cursor" })

                vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "open diff for current buffer" })
                vim.keymap.set("n", "<leader>hw", gitsigns.toggle_word_diff, { desc = "toggle word diff" })
                vim.keymap.set("n", "<leader>htd", gitsigns.toggle_deleted, { desc = "toggle deleted hunks" })
            end,
        })
    end,
}
