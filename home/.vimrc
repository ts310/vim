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
  Plugin 'scrooloose/syntastic'
  Plugin 'vim-scripts/Align'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-bundler'
  Plugin 'mkitt/tabline.vim'
  Plugin 'tyru/open-browser.vim'
  Plugin 'vim-scripts/vcscommand.vim'
  Plugin 'tpope/vim-surround'
  Plugin 'ivalkeen/vim-ctrlp-tjump'

  call vundle#end()
  filetype plugin indent on
" }}}

" ------------------------------------------------------------
" Basic settings
" ------------------------------------------------------------
" {{{
  colorscheme solarized

  set hidden
  set number
  set ruler
  set backspace=indent,eol,start
  set history=1000
  set showcmd
  set showmode
  set visualbell t_vb=
  set autoread
  set encoding=utf-8
  set virtualedit+=block
  set clipboard+=unnamedplus,unnamed,autoselect
  set tags+=.tags
  set laststatus=2
  set cmdheight=1
  set cursorline
  set imdisable

  " Optimization
  set noshowmatch
  set lazyredraw
  set ttyfast
  set ttyscroll=3

  " turn off swap file
  set noswapfile
  set nobackup
  set nowb

  " indentaion
  set list
  set autoindent
  set smartindent
  set smarttab
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
  set listchars=eol:¬,tab:▸\ ,nbsp:.

  " wrapping
  set textwidth=100
  set wrap
  set wrapscan
  set linebreak

  " search
  set complete+=k
  set ignorecase
  set smartcase
  set incsearch
  set viminfo='100,f1

  " folding
  set foldenable
  set foldmethod=indent
  set foldnestmax=10
  set foldlevelstart=10

  " mapping
  let mapleader = " "

  " save typing
  nmap ; :

  nmap j gj
  nmap k gk

  " Strip all trading whitespace in current while
  nmap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

  " unhighlight searched word
  nmap <ESC><ESC> :nohlsearch<CR><ESC>

  " command
  command! Ev edit $MYVIMRC
  command! Rv source $MYVIMRC
" }}}

" ------------------------------------------------------------
" nerdtree
" ------------------------------------------------------------
" {{{
  nnoremap <leader>d :NERDTreeToggle<CR>
  nnoremap <leader>nr :NERDTreeFind<CR>
" }}}

" ------------------------------------------------------------
" ctrlp
" ------------------------------------------------------------
" {{{
  let g:ctrlp_extensions = ['funky']
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor|\cache',
    \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
    \ }
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_match_window = 'bottom,order:ttb'
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_max_files = 0
  nnoremap <c-]> :CtrlPtjump<cr>
  vnoremap <c-]> :CtrlPtjumpVisual<cr>
" }}}

" ------------------------------------------------------------
" ag
" ------------------------------------------------------------
" {{{
  map <leader>ag :Ag -i<space>
  abbrev ag Ag
" }}}

" ------------------------------------------------------------
" fugitive
" ------------------------------------------------------------
" {{{
  command! Gd :Gdiff
  command! Gc :Gcommit
  command! Gw :Gwrite
  command! Gs :Gstatus
" }}}

" ------------------------------------------------------------
" vcscommand
" ------------------------------------------------------------
" {{{
  nmap [VCS] <Nop>
  nmap <Leader>v [VCS]
  let g:VCSCommandMapPrefix = '[VCS]'
  cabbrev vcsgotooriginal VCSGotoOriginal
  cabbrev vcslog VCSLog
  cabbrev vcsreview VCSReview
  cabbrev vcsstatus VCSStatus
  cabbrev vcsupdate VCSUpdate
  cabbrev vcsvimdiff VCSVimDiff
" }}}

" ------------------------------------------------------------
" gitv
" ------------------------------------------------------------
" {{{
  cabbrev git Git
  cabbrev gitv Gitv
  let g:Gitv_OpenHorizontal = 1
  let g:Gitv_WrapLines = 0
  let g:Gitv_TruncateCommitSubjects = 1
  let g:Gitv_OpenPreviewOnLaunch = 1
  let g:Gitv_DoNotMapCtrlKey = 1
" }}}

" ------------------------------------------------------------
" tab
" ------------------------------------------------------------
" {{{
  set showtabline=2
  nmap [Tag] <Nop>
  nmap     t [Tag]
  for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
  endfor
  map <silent> [Tag]c :tablast <bar> tabnew<CR>
  map <silent> [Tag]x :tabclose<CR>
  map <silent> [Tag]n :tabnext<CR>
  map <silent> [Tag]p :tabprevious<CR>
" }}}

" ------------------------------------------------------------
" syntastic
" ------------------------------------------------------------
" {{{
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_always_populate_loc_list = 0
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1
  let g:syntastic_loc_list_height = 6
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_javascript_checkers = ['jshint']
  let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['ruby', 'javascript'],
    \ 'passive_filetypes': []
    \ }
" }}}

" ------------------------------------------------------------
" open-browser
" ------------------------------------------------------------
" {{{
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)
" }}}
