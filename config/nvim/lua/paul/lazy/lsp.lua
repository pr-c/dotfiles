return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "skywind3000/asyncrun.vim",
        "latex-lsp/texlab",
        "lervag/vimtex"
    },


    config = function()
        vim.lsp.config('*', {
            capabilities = capabilities
        })

        vim.lsp.config('texlab', {
            on_attach = function()
                vim.keymap.set("n", "<leader>m", function() vim.cmd("AsyncRun! make") end)
            end,
            capabilities = capabilities
        })


        vim.lsp.config('rust_analyzer', {
            capabilities = capabilities,
        })
        vim.lsp.config('wgsl_analyzer', {
            capabilities = capabilities,
        })

        vim.lsp.config('pyright', {
            capabilities = capabilities,
        })

        --        vim.lsp.config('ccls', {
        --   capabilities = capabilities,
        --   })

        vim.lsp.config('asm_lsp', {
            capabilities = capabilities,
        })

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = false,
        })
        
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--query-driver=*"
            },
            filetypes = { "c", "cpp", "objc", "objcpp" },
            root_dir = vim.fs.root(0, {
                "compile_commands.json",
                ".git"
            }),
        })
        vim.lsp.enable("clangd")
        vim.lsp.enable("rust_analyzer")
        vim.lsp.enable("wgsl_analyzer")
        vim.lsp.enable("texlab")
        vim.lsp.enable("pyright")

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(e)
                local opts = { buffer = e.buf }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("n", "<leader>lf", function() vim.diagnostic.open_float() end, opts)

                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)

                vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
            end
        })

        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_syntax_conceal_disable = true


    end
}
