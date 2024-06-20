return {
    -- "theprimeagen/git-worktree.nvim"
    -- Shit's broken need to use fixed repo for now until @polarmutex releases v2
    "nooproblem/git-worktree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        -- using oil as default file explorer
        "stevearc/oil.nvim",
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

        gwt.on_tree_change(function(op, metadata)
            if op == gwt.Operations.Switch then
                print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
                print(vim.fn.expand("%"))
            end
            -- Update oil.nvim file explorer
            local curbuf = vim.fn.expand("%")
            if curbuf:find("^oil:///") then
                require("oil").open(vim.fn.getcwd())
            end
        end)
    end,
}
