return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require'nvim-treesitter'.setup {
            ensure_installed = { "c", "lua", "rust", "cpp", "css", "html", "matlab"},

            sync_install = false,
            auto_install = false,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            }
        }

        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldlevel=99

    end
}
