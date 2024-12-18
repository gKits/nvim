vim.filetype.add({
    extension = {
        templ = "templ",
        env = "dotenv",
    },
    pattern = {
        ["*compose.ya?ml"] = "yaml.docker-compose",
        ["openapi.*%.ya?ml"] = "yaml.openapi",
        ["openapi.*%.json"] = "json.openapi",
    },
    filename = {},
})
