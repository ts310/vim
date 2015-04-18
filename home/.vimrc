" ------------------------------------------------------------
" Plugin
" ------------------------------------------------------------
" {{{
  set nocompatible
  filetype off

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'gmarik/Vundle.vim'
  Plugin 'tpope/vim-sensible'
  Plugin 'tpope/vim-fugitive'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'rking/ag.vim'
  Plugin 'AndrewRadev/linediff.vim'
  Plugin 'gregsexton/gitv'
  Plugin 'kien/ctrlp.vim'
  Plugin 'tacahiroy/ctrlp-funky'
  Plugin 'd11wtq/ctrlp_bdelete.vim'

  call vundle#end()
  filetype plugin indent on
" }}}

" ------------------------------------------------------------
" Basic settings
" ------------------------------------------------------------
" {{{
  colorscheme solarized

  let mapleader = " "

  set ignorecase
  set smartcase

  nnoremap j gj
  nnoremap k gk

  nnoremap <leader>d :NERDTreeToggle<CR>
  nnoremap <leader>nr :NERDTreeFind<CR>

  command! Ev edit $MYVIMRC
  command! Rv source $MYVIMRC
" }}}

" ------------------------------------------------------------
" CtrlP
" ------------------------------------------------------------
" {{{
  let g:ctrlp_extensions = ['funky']
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor',
    \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
    \ }
" }}}
