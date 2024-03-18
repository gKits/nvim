vim.api.nvim_create_user_command("GoAddTags", function(opts)
    print(opts.args)

    local pargs = vim.split(opts.args, " ")

    if #pargs < 2 then
        pargs[1] = "json"
    end

    local args = pargs[1]
    for i = 2, #pargs do
        args = args .. "," .. pargs[i]
    end

    local cmd = "gomodifytags -quiet -struct <cword> -file % -transform snakecase -w -add-tags " .. args

    pcall(function()
        vim.cmd("w")
        vim.cmd("silent !" .. cmd)
    end)
end, { nargs = "?" })

-- Create open tmux-session script in separate tmux window
vim.api.nvim_create_user_command("TmuxSession", function()
    pcall(function()
        vim.cmd("silent !tmux neww tmux-session")
    end)
end, {})
