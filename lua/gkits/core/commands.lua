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

vim.api.nvim_create_user_command("GoGenTest", function()
    pcall(function()
        vim.cmd("!gotests -only <cword> -w %")
    end)
end, {})

vim.api.nvim_create_user_command("GoGenAllTests", function()
    pcall(function()
        vim.cmd("!gotests -all -w %")
    end)
end, {})

vim.api.nvim_create_user_command("GoTest", function(opts)
    local cmd = "tmux neww -n GoTest 'go test -race -cover " .. opts.args .. " 2>&1 | less'"
    pcall(function()
        vim.cmd("!" .. cmd)
    end)
end, { nargs = 1, complete = "dir" })

vim.api.nvim_create_user_command("GoTestCover", function(opts)
    local path = vim.split(opts.args, "/")
    local outpath = vim.fn.getcwd() .. "/out/"

    if not vim.fn.isdirectory("outpath") then
        print("directory" .. outpath .. " does not exist")
        return
    end
    outpath = outpath .. path[#path - 1] .. ".out"

    local cmd = "tmux neww -n GoTest 'go test -race -coverprofile " .. outpath .. " " .. opts.args .. " 2>&1 | less'"

    pcall(function()
        vim.cmd("silent !" .. cmd)
        vim.cmd("silent !go tool cover -html=" .. outpath)
    end)
end, { nargs = 1, complete = "dir" })
