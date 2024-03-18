return {
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",

    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open [g]it ui [s]?" }),
    vim.keymap.set("n", "<leader>mt", "<cmd>Gvdiffsplit!<cr>", { desc = "Open [m]erge[t]ool" }),
    vim.keymap.set("n", "<leader>mh", "<cmd>diffget //2<cr>", { desc = "Select to merge from left" }),
    vim.keymap.set("n", "<leader>ml", "<cmd>diffget //3<cr>", { desc = "Select to merge from right" }),
}
