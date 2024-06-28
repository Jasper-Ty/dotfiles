require("defaults")

--- Find or install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--- Keymaps
vim.keymap.set('n', 'K', vim.lsp.with(vim.lsp.buf.hover, { border = "rounded" }))

--- Start lazy
require("lazy").setup({
    --- misc
    "folke/which-key.nvim",

    --- tokyonight colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme tokyonight-night]]
        end,
    },

    --- VimTeX
    {
        "lervag/vimtex",
        config = function()
            vim.opt_local.conceallevel = 2
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_syntax_conceal = {
                conceallevel = 2,
                math_bounds = 1,
            }
            vim.g.vimtex_compiler_latexmk = {
                aux_dir = 'aux',
                out_dir = 'out',
                options = {
                    '-verbose',
                    '-file-line-error',
                    '-interaction=nonstopmode',
                    '-shell-escape',
                },
            }
        end,
    },

    --- Mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        lazy = false,
        priority = 0,
        config = function()
            local mason = require("mason")
            local masonlsp = require("mason-lspconfig")
            local lspconfig = require("lspconfig")

            mason.setup()
            masonlsp.setup()

            lspconfig.rust_analyzer.setup({
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = false;
                        }
                    }
                },
                handlers = {
                    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                }
            })
            lspconfig.html.setup({})
            lspconfig.pyright.setup({})
            lspconfig.texlab.setup({})
        end,
    },

    --- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",

            "SirVer/ultisnips",
            "quangnguyen30192/cmp-nvim-ultisnips",

            "micangl/cmp-vimtex",
            "kdheepak/cmp-latex-symbols",
        },
        lazy = false,
        priority = 0,
        config = function() 
            local cmp = require("cmp")

            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-g>'] = function()
                        if cmp.visible_docs() then
                            cmp.close_docs()
                        else
                            cmp.open_docs()
                        end
                    end,
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'latex_symbols' },
                    { name = 'ultisnips' },
                })
            })

            -- vimtex
            cmp.setup.filetype("tex", {
                sources = {
                    { name = 'vimtex' },
                    { name = 'buffer' },
                }
            })

            -- Set up lspconfig
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("lspconfig")["texlab"].setup { capabilities = capabilities }
            require("lspconfig")["rust_analyzer"].setup { capabilities = capabilities }
            require("lspconfig")["pyright"].setup { capabilities = capabilities }
        end,
    },

    --- lualine
    "nvim-tree/nvim-web-devicons",
    { 
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup()
        end,
    },

    -- sage
    "petRUShka/vim-sage"
})
