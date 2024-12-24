local findfile = vim.fn.findfile
local cwd = vim.fn.getcwd

vim.filetype.add({
    pattern = {
        ["openapi.*%.ya?ml"] = "yaml.openapi",
        ["openapi.*%.json"] = "json.openapi",
        ["*%compose.ya?ml"] = "yaml.docker-compose",
    },
    filename = {
        [".gitlab-ci.yml"] = "yaml.gitlab",
        [".gitlab-ci.yaml"] = "yaml.gitlab",
    },
    extension = {
        templ = "templ",
        env = "dotenv",
        yaml = function(_, _, _)
            if findfile("ansible.cfg", cwd()) ~= "" then
                return "yaml.ansible"
            end
            return "yaml"
        end,
        yml = function(_, _, _)
            if findfile("ansible.cfg", cwd()) ~= "" then
                return "yaml.ansible"
            end
            return "yaml"
        end,
    },
})
