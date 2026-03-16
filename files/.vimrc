set nocompatible              " be iMproved, required
filetype off                  " required
set clipboard=unnamedplus
set number

let mapleader = ","

" Clipboard mappings
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "*yy

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'kaarmu/typst.vim'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'vim-autoformat/vim-autoformat'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call plug#end()
"call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache


inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<cr>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

"autocmd CursorHold * if &filetype != 'typst' | silent call CocActionAsync('doHover') | endif
autocmd CursorHold * if CocHasProvider('hover') | silent call CocActionAsync('doHover') | endif

let g:ale_disable_lsp = 1

set background=dark
colorscheme gruvbox

let g:airline_theme = 'transparent'
highlight Normal guibg=NONE ctermbg=NONE

autocmd FileType typst let b:airline_whitespace_disabled = 1
set termguicolors

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

let g:coc_global_extensions = [
  \ '@yaegassy/coc-pylsp',
  \ 'coc-json',
  \ 'coc-git',
  \ 'coc-clangd',
  \ 'coc-go',
  \ 'coc-rust-analyzer',
  \ 'coc-yaml',
  \ 'coc-sh',
  \ 'coc-cmake',
  \ 'coc-toml',
  \ 'coc-docker',
  \ 'coc-xml',
  \ 'coc-spell-checker',
  \ ]
