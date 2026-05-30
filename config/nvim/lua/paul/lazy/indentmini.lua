return {
    "nvimdev/indentmini.nvim",
    init = function()
        require("indentmini").setup()
        vim.cmd.highlight('IndentLine guifg=#5d5e5e')
    vim.cmd.highlight('IndentLineCurrent guifg=#c7c7c7')
    end,
}
