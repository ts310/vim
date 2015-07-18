set nocompatible

" ------------------------------------------------------------
" Plugin
" ------------------------------------------------------------
" {{{
  call plug#begin('~/.vim/plugged')

  Plug 'christoomey/vim-run-interactive'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-endwise'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/nerdtree'
  Plug 'altercation/vim-colors-solarized'
  Plug 'rking/ag.vim'
  Plug 'AndrewRadev/linediff.vim'
  Plug 'gregsexton/gitv'
  Plug 'kien/ctrlp.vim'
  Plug 'tacahiroy/ctrlp-funky'
  Plug 'd11wtq/ctrlp_bdelete.vim'
  Plug 'scrooloose/syntastic'
  Plug 'vim-scripts/Align'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-bundler'
  Plug 'mkitt/tabline.vim'
  Plug 'tyru/open-browser.vim'
  Plug 'vim-scripts/vcscommand.vim'
  Plug 'tpope/vim-surround'
  Plug 'ivalkeen/vim-ctrlp-tjump'
  Plug 'mattn/emmet-vim'
  "Plug 'bling/vim-airline'
  Plug 'keith/swift.vim'
  Plug 'slim-template/vim-slim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'tpope/vim-obsession'
  Plug 'dhruvasagar/vim-prosession'
  Plug 'majutsushi/tagbar'
  Plug 'schickling/vim-bufonly'
  Plug 'embear/vim-localvimrc'
  Plug 'tpope/vim-dispatch'
  Plug 'thoughtbot/vim-rspec'

  call plug#end()
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
  set nocursorline
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
  set wrap
  set wrapscan
  set linebreak
  set colorcolumn=80

  " search
  set complete+=k
  set ignorecase
  set smartcase
  set incsearch
  set hlsearch
  set viminfo='100,f1

  " folding
  set foldenable
  set foldmethod=indent
  set foldnestmax=10
  set foldlevelstart=10

  " always use vertical diffs
  set diffopt+=vertical

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

  " Run commands that require an interactive shell
  nnoremap <Leader>ri :RunInInteractiveShell<space>
" }}}

" ------------------------------------------------------------
" Syntax
" ------------------------------------------------------------
" {{{
  au FileType make         setlocal ts=8 sts=8 sw=8 noet
  au FileType yaml         setlocal ts=2 sts=2 sw=2 et
  au FileType php          setlocal ts=4 sts=4 sw=4 noet foldmethod=indent
  au FileType smarty       setlocal ts=2 sts=2 sw=2 noet foldmethod=indent
  au FileType java         setlocal ts=4 sts=4 sw=4 et   foldmethod=syntax
  au FileType vim          setlocal ts=2 sts=2 sw=2 et
  au FileType html         setlocal ts=2 sts=2 sw=2 et
  au FileType css          setlocal ts=2 sts=2 sw=2 et   foldmethod=indent
  au FileType javascript   setlocal ts=4 sts=4 sw=4 et   foldmethod=indent
  au FileType sh           setlocal ts=2 sts=2 sw=2 et
  au FileType ruby         setlocal ts=2 sts=2 sw=2 et   foldmethod=indent
  au FileType sql          setlocal ts=2 sts=2 sw=2 noet foldmethod=indent
  au BufNewFile,BufRead *.rss     setfiletype xml
  au BufNewFile,BufRead *.thtml   setfiletype php
  au BufNewFile,BufRead *.tpl     setfiletype smarty
  au BufNewFile,BufRead *_spec.rb compiler    rspec
" }}}

" ------------------------------------------------------------
"  Auto command
" ------------------------------------------------------------
" {{{
  " Automatically shift the cursor to the postition of last time the file was
  " open
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" }}}

" ------------------------------------------------------------
" nerdtree
" ------------------------------------------------------------
" {{{
  nnoremap <leader>d :NERDTreeToggle<CR>
  nnoremap <leader>nr :NERDTreeFind<CR>
  let g:NERDTreeWinSize = 24
" }}}

" ------------------------------------------------------------
" ctrlp
" ------------------------------------------------------------
" {{{
  let g:ctrlp_map = '<C-p>'
  let g:ctrlp_cmd = 'CtrlP'
  map <Leader>p :CtrlP<CR>
  let g:ctrlp_extensions = ['funky']
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:40'
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_max_files = 0
  let g:ctrlp_max_depth = 0
  let g:ctrlp_use_migemo = 1
  let g:ctrlp_funky_syntax_highlight = 1
  let g:ctrlp_follow_symlinks = 1
  if executable('ag')
    let g:ctrlp_user_command = 'Ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_caching = 0
  endif
  nnoremap <c-]> :CtrlPtjump<cr>
  vnoremap <c-]> :CtrlPtjumpVisual<cr>
  nnoremap <Leader>fu :CtrlPFunky<Cr>
  nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" }}}

" ------------------------------------------------------------
" ag
" ------------------------------------------------------------
" {{{
  abbrev ag Ag
  noremap <Leader>ag :Ag -i<space>
" }}}

" ------------------------------------------------------------
" fugitive
" ------------------------------------------------------------
" {{{
  command! Gd :Gdiff
  command! Gc :Gcommit
  command! Gw :Gwrite
  command! Gs :Gstatus
  " remove fugitive buffer when buffer is no longer needed
  au BufReadPost fugitive://* set bufhidden=delete
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
" emmet
" ------------------------------------------------------------
" {{{
  let g:user_emmet_leader_key = '<c-t>'
" }}}

" ------------------------------------------------------------
" Vim airline
" ------------------------------------------------------------
" {{{
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
" }}}

" ------------------------------------------------------------
" Vim rspec
" ------------------------------------------------------------
" {{{
  nmap <Leader>c :call RunCurrentSpecFile()<CR>
  nmap <Leader>n :call RunNearestSpec()<CR>
  nmap <Leader>l :call RunLastSpec()<CR>
  nmap <Leader>a :call RunAllSpecs()<CR>
" }}}

" ------------------------------------------------------------
" Vim localvimrc
" ------------------------------------------------------------
" {{{
  let g:localvimrc_ask = 0
" }}}
