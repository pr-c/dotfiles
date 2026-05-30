return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'ghassan0/telescope-glyph.nvim'},
    config = function() 
        require("telescope").setup({
            pickers = {
                colorscheme = {
                    enable_preview = true,
                }
            }
        })
        require('telescope').load_extension('glyph')
    end
}
