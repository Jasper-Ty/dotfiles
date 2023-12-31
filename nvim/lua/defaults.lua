vim.cmd([[
    set nocompatible
    set showmatch

    set mouse=v
    set hlsearch
    set incsearch

    set tabstop=4
    set softtabstop=4
    set expandtab

    set shiftwidth=4
    set autoindent

    set number
    set wildmode=longest,list
    filetype plugin indent on
    syntax on
    set mouse=a
    set clipboard=unnamedplus
    filetype plugin on
    set ttyfast
    set noswapfile

    let g:loaded_netrw = 1
    let g:loaded_netrwPlugin = 1

    autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
]])
