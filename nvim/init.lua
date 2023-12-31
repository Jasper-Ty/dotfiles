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


--- Start lazy
require("lazy").setup({
    --- tokyonight colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme tokyonight-night]]
        end,
    },

    --- Vimtex
    {
        "lervag/vimtex",
        config = function()
            vim.g.vimtex_view_method = "zathura"
        end,
    },

    --- Mason
    { 
        "williamboman/mason.nvim",
        lazy = false,
        priority = 0,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        priority = 0,
    },
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
                }
            })
            lspconfig.html.setup({})
            lspconfig.pyright.setup({})
            lspconfig.texlab.setup({})
        end,
    },

    --- nvim-cmp
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        lazy = false,
        priority = 30,
        config = function() 
            local cmp = require("cmp")

            cmp.setup({
                sources = cmp.config.sources({
                    { name = "nvim-lsp" }
                })
            })
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
})
