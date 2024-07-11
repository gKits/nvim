return {
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",

    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = { "open git status ui" } }),
    vim.keymap.set("n", "<leader>mt", "<cmd>Gvdiffsplit!<cr>", { desc = "Open [m]erge[t]ool" }),
    vim.keymap.set("n", "<leader>mh", "<cmd>diffget //2<cr>", { desc = "Select to merge from left" }),
    vim.keymap.set("n", "<leader>ml", "<cmd>diffget //3<cr>", { desc = "Select to merge from right" }),

    -- vim.keymap.set("n", "<leader>gs", function()
    --     for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    --         if vim.api.nvim_buf_get_name(bufnr):find("^fugitive://") then
    --             vim.api.nvim_buf_delete(bufnr, { force = false })
    --             return
    --         end
    --     end
    --     vim.cmd.Git()
    -- end, { desc = { "toggle git status ui" } }),
}
