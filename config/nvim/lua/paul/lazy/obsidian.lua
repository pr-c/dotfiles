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
        daily_notes = {
            enabled = true,
            folder = "daily",
            date_format = "YYYY-MM-DD",
            alias_format = nil,
            default_tags = { "daily-notes" },
            workdays_only = false,
        },
    },

}
