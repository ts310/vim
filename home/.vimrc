" plugin loading {{{
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-run-interactive'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
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
Plug 'bling/vim-airline'
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
Plug 'tpope/vim-repeat'
"Plug 'svermeulen/vim-easyclip'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'schickling/vim-bufonly'
"Plug 'tpope/vim-vinegar'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'othree/yajs.vim'
Plug 'benmills/vimux'
call plug#end()
" }}}

" basic settings {{{
set nocompatible
if !exists('g:colors_name')
  silent! colorscheme solarized
  set background=dark
endif
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
set cmdheight=2
set display=lastline
set lazyredraw
set noswapfile
set list
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set shiftround
set softtabstop=2
set tabstop=2
set expandtab
set listchars=eol:¬,tab:▸\ ,trail:.
set linebreak
set colorcolumn=100
set complete+=k
set ignorecase
set smartcase
set incsearch
set hlsearch
set viminfo='100,f1
set foldmethod=marker
set foldopen+=jump
set foldnestmax=10
set foldlevelstart=10
set diffopt+=vertical
set nowrap
set spell
if has("re")
  set re=1
endif

" mapping {{{
let mapleader = " "
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
" bind K to grep word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>
" }}}

" auto command {{{
if has("autocmd")
  " shift the cursor to the postition of last time the file was open
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  " Syntax
  autocmd FileType make       setlocal ts=8 sts=8 sw=8 noet
  autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType php        setlocal ts=4 sts=4 sw=4 noet foldmethod=indent
  autocmd FileType smarty     setlocal ts=2 sts=2 sw=2 noet foldmethod=indent
  autocmd FileType java       setlocal ts=4 sts=4 sw=4 et   foldmethod=syntax
  autocmd FileType vim        setlocal ts=2 sts=2 sw=2 et
  autocmd FileType html       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType css        setlocal ts=2 sts=2 sw=2 et   foldmethod=indent
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 et   foldmethod=indent
  autocmd FileType sh         setlocal ts=2 sts=2 sw=2 et
  autocmd FileType ruby       setlocal ts=2 sts=2 sw=2 et   foldmethod=indent
  autocmd FileType sql        setlocal ts=2 sts=2 sw=2 noet foldmethod=indent
  autocmd BufNewFile,BufRead *.rss     setfiletype xml
  autocmd BufNewFile,BufRead *.thtml   setfiletype php
  autocmd BufNewFile,BufRead *.tpl     setfiletype smarty
  autocmd BufNewFile,BufRead *.es6     setfiletype javascript
  autocmd BufNewFile,BufRead *_spec.rb compiler    rspec
  autocmd InsertEnter * if !exists('w:last_fdm')
              \| let w:last_fdm=&foldmethod
              \| setlocal foldmethod=manual
              \| endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm')
              \| let &l:foldmethod=w:last_fdm
              \| unlet w:last_fdm
              \| endif
endif
" }}}
" }}} end basic settings

" plugins {{{
" nerdtree {{{
"nnoremap <leader>d :NERDTreeToggle<CR>
"nnoremap <leader>nf :NERDTreeFind<CR>
"nnoremap <leader>nr :NERDTreeCWD<CR>
let g:NERDTreeWinSize = 24
"let g:NERDTreeHijackNetrw = 0
" }}}

" netrw {{{
"let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_winsize = 30
let g:netrw_banner  = 0
" }}}

" ctrlp {{{
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
map <Leader>p :CtrlP<CR>
let g:ctrlp_extensions = ['funky', 'smarttabs']
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
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'Ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_use_caching = 0
endif
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" }}}

" ag {{{
abbrev ag Ag
noremap <Leader>ag :Ag -i<space>
" }}}

" fugitive {{{
command! Gd :Gdiff
command! Gc :Gcommit
command! Gw :Gwrite
command! Gs :Gstatus
" remove fugitive buffer when buffer is no longer needed
au BufReadPost fugitive://* set bufhidden=delete
" }}}

" vcscommand {{{
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

" gitv {{{
cabbrev git Git
cabbrev gitv Gitv
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WrapLines = 0
let g:Gitv_TruncateCommitSubjects = 1
let g:Gitv_OpenPreviewOnLaunch = 1
let g:Gitv_DoNotMapCtrlKey = 1
" }}}

" tab {{{
nmap [Tab] <Nop>
nmap t [Tab]
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
map <silent> [Tab]c :tablast <bar> tabnew<CR>
map <silent> [Tab]x :tabclose<CR>
map <silent> [Tab]n :tabnext<CR>
map <silent> [Tab]p :tabprevious<CR>
" }}}

" syntastic {{{
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 6
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': ['ruby', 'javascript'],
  \ 'passive_filetypes': []
  \ }
" }}}

" emmet {{{
let g:user_emmet_leader_key = '<c-t>'
" }}}

" airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" }}}

" rspec {{{
nmap <Leader>c :call RunCurrentSpecFile()<CR>
nmap <Leader>n :call RunNearestSpec()<CR>
nmap <Leader>l :call RunLastSpec()<CR>
nmap <Leader>a :call RunAllSpecs()<CR>
" }}}

" localvimrc {{{
let g:localvimrc_ask = 0
" }}}

" require an interactive shell {{{
nnoremap <Leader>ri :RunInInteractiveShell<space>
" }}}
" }}} end plugins

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
