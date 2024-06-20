return {
    "rusagaib/oas-preview.nvim",
    event = { "BufEnter *.yml", "BufEnter *.yaml" },
    config = function()
        require("oas-preview")
    end,
}
