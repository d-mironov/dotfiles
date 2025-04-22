local obsidian = require('obsidian')

obsidian.setup({
    workspaces = {
        {
            name = "Notes",
            path = "~/Notes/obsidian",
        },
    },

    templates = {
        folder = "Templates",
    },

    attachments = {
        img_folder = "Attachments",
        img_text_func = function(client, path)
            path = client:vault_relative_path(path) or path
            return string.format("![[%s]]", path.name)
        end,
    },

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },
    disable_frontmatter = false,
})
