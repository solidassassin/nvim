set foldmethod=marker foldenable

filetype plugin indent on
syntax enable

set mouse=a
set ts=4 sw=4
set clipboard+=unnamedplus
set number
set noshowmode
set relativenumber
set termguicolors
set ignorecase
set smartcase

" Remaps {{{
nnoremap <silent> <Esc> :nohlsearch<CR>
nnoremap <silent> <Space>f :call CocAction('format')<CR>
nnoremap <silent> <Space>p :FZF<CR>
" }}}

" Plugins {{{
call plug#begin(stdpath('data') . '/plugged')

" Utility
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
" Customization
Plug 'kaicataldo/material.vim'
Plug 'joshdick/onedark.vim'
Plug 'ntk148v/vim-horizon'
Plug 'itchyny/lightline.vim'
" Language specific
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'
Plug 'vim-python/python-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'ekalinin/Dockerfile.vim'
" Misc
Plug 'MonliH/vimsence'

call plug#end()
" }}}

" Theme {{{
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
colorscheme onedark
" }}}

" Languages {{{
let g:python3_host_prog = '/usr/bin/python3'
let g:latex_to_unicode_auto = 1
let g:python_highlight_all = 1
" }}}

" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle
" }}}

" Discord {{{
let g:vimsence_client_id = '422042111827902484'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_file_explorer_text = 'In file explorer'
let g:vimsence_file_explorer_details = 'Looking for files'
" }}}
