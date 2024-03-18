return {
    -- "theprimeagen/git-worktree.nvim"
    -- Shit's broken need to use fixed repo for now until @polarmutex releases v2
    "nooproblem/git-worktree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },

    config = function()
        local gwt = require("git-worktree")
        gwt.setup()

        local telescope = require("telescope")
        telescope.load_extension("git_worktree")

        vim.keymap.set("n", "<Leader>gw", telescope.extensions.git_worktree.git_worktrees, {
            desc = "List [g]it [w]orktrees",
        })
        vim.keymap.set("n", "<Leader>gW", telescope.extensions.git_worktree.create_git_worktree, {
            desc = "List [g]it [W]orktrees and create new worktree",
        })

        -- local Hooks = require("git-worktree.hooks")
        -- worktree.hooks({ SWITCH = Hooks.builtins.update_current_buffer_on_switch })
    end,
}
