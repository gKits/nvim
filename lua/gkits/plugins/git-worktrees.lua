return {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        -- using oil as default file explorer
        "stevearc/oil.nvim",
    },

    config = function()
        require("telescope").load_extension("git_worktree")

        vim.keymap.set("n", "<Leader>gw", require("telescope").extensions.git_worktree.git_worktree, {
            desc = "List [g]it [w]orktrees",
        })
        vim.keymap.set("n", "<Leader>gW", require("telescope").extensions.git_worktree.create_git_worktree, {
            desc = "List [g]it [W]orktrees and create new worktree",
        })

        local Hooks = require("git-worktree.hooks")

        Hooks.register(Hooks.type.SWITCH, Hooks.builtins.update_current)
        Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
            print(prev_path .. "  ~>  " .. path)
            local curbuf = vim.fn.expand("%")
            if curbuf:find("^oil:///") then
                require("oil").open(vim.fn.getcwd())
            end
        end)
    end,
}
