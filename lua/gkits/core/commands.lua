vim.api.nvim_create_user_command("GoAddTags", function(opts)
    if #opts.fargs < 1 then
        opts.fargs[1] = "json"
    end

    local args = opts.fargs[1]
    for i = 2, #opts.fargs do
        args = args .. "," .. opts.fargs[i]
    end

    local cmd = "gomodifytags -struct <cword> -file % -transform snakecase -w -add-tags " .. args

    pcall(function()
        vim.cmd("w")
        vim.cmd("!" .. cmd)
    end)
end, { nargs = "*" })

-- Create open tmux-session script in separate tmux window
vim.api.nvim_create_user_command("TmuxSession", function()
    pcall(function()
        vim.cmd("silent !tmux neww tmux-session")
    end)
end, {})
