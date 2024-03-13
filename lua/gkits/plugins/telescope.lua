return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "truncate" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    }
                }
            }
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap.set

        keymap("n", "<leader>sf", builtin.find_files, { desc = "[s]earch [f]iles" })
        keymap("n", "<leader>?", builtin.find_files, { desc = "Search recently opened files" })
        keymap("n", "<leader>sg", builtin.live_grep, { desc = "[s]earch with live [g]rep in cwd" })
        keymap("n", "<leader>sc", builtin.grep_string, { desc = "[s]earch string under [c]ursor in cwd" })
        keymap("n", "<leader>sd", builtin.diagnostics, { desc = "[s]earch in [d]iagnostics" })
        keymap("n", "<leader>sh", builtin.help_tags, { desc = "[s]earch [h]elp" })
        keymap('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Search existing buffers' })
        keymap('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = 'Fuzzily search in current buffer' })
    end

}
