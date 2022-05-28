set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set exrc
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nu
set nowrap
set smartcase

set noswapfile
set nobackup
set undodir=~/.vim/indodir
set undofile

set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set ignorecase

set signcolumn=yes
set cmdheight=2
set updatetime=50
set shortmess+=c

set pumheight=7

call plug#begin('~/.vim/plugged')
"COLOR SCHEME
Plug 'gruvbox-community/gruvbox'

"LSP
Plug 'neovim/nvim-lspconfig'

" Telescope requires plenary to function
Plug 'nvim-lua/plenary.nvim'
" The main Telescope plugin
Plug 'nvim-telescope/telescope.nvim'
" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

"TREESITTER
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"CMP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"autosnip
Plug 'L3MON4D3/LuaSnip'
"CMD
Plug 'akinsho/toggleterm.nvim'

call plug#end()

colorscheme gruvbox

let mapleader=" "
highlight Normal guibg=none

"enter normal mode
inoremap kj <Esc>
inoremap jk <Esc>

"window nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ERIC
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup end

"Plugins: lsp, telescope, treesitter, undotree, figitive

lua require('ekhar.lspconfig')
lua require('ekhar.cmp')
lua require('ekhar.telescope')
lua require('ekhar.treesitter')
lua require('ekhar.toggleterm')
