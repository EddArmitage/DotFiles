" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Setup Pathogen for plugin management"
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Wrap lines at 110 chars
set tw=110

" Switch syntax highlighting on
syntax enable
set background=dark
colorscheme solarized

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers and cursor position
set number
set ruler
set rulerformat=%l,%v

" Set Spell-Checking colours and language
" Spell is toggled by <leader>s
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=Red term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap ctermfg=Green term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare ctermfg=Cyan term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal ctermfg=Magenta term=underline cterm=underline
set spelllang=en_gb
nmap <silent> <leader>s :set spell!<CR>

" Set file type for .tex files to be latex
let g:tex_flavor='latex'
