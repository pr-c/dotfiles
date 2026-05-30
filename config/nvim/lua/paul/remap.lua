local map = vim.keymap.set

local tsbuiltin = require("telescope.builtin")
map("n", "<leader>pv", vim.cmd.Oil)
map("n", "<leader>pf", tsbuiltin.find_files, {})
map("n", "<leader>pg", tsbuiltin.git_files, {})
map("n", "<leader>ps", tsbuiltin.live_grep)
map("n", "z=", tsbuiltin.spell_suggest, {})

map("n", "<leader>b", tsbuiltin.buffers, {})
map("n", "<leader>o", tsbuiltin.oldfiles, {})


map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

map("n", "<leader>P", "\"+p")
map("v", "<leader>P", "\"+p")

map("n", "Q", "<nop>")

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

map("n", "<leader>gs", vim.cmd.Git);
map("n", "<leader>u", vim.cmd.UndotreeToggle)

local harpoon = require("harpoon")
map("n", "<leader>a", function() harpoon:list():add() end)

map("n", "<A-j>", function() harpoon:list():select(1) end)
map("n", "<A-k>", function() harpoon:list():select(2) end)
map("n", "<A-l>", function() harpoon:list():select(3) end)
map("n", "<A-;>", function() harpoon:list():select(4) end)

map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)


map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("i", "<M-u>", "ü")
map("i", "<M-S-u>", "Ü")
map("i", "<M-o>", "ö")
map("i", "<M-S-o>", "Ö")
map("i", "<M-a>", "ä")
map("i", "<M-S-a>", "Ä")
map("i", "<M-s>", "ß")


map("n", "<leader>vs", function()
        require("obsidian").get_client():command("ObsidianSearch", {})
    end
)
map("n", "<leader>vo", function()
        require("obsidian").get_client():command("ObsidianQuickSwitch", {})
    end
)
map("n", "<leader>vb", function()
        require("obsidian").get_client():command("ObsidianBacklinks", {})
    end
)
map("n", "<leader>vl", function()
        require("obsidian").get_client():command("ObsidianLinks", {})
    end
)
map("n", "<leader>va", function()
        require("obsidian").get_client():command("ObsidianOpen", {})
    end
)
