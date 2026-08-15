return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "personal",
                path = "~/obsidian",
            },
        },
    },
}
