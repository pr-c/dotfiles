return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    { 
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            vim.cmd("colorscheme catppuccin")
        end
    }
}
