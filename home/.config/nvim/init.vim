" plug-in loading {{{
call plug#begin('~/.local/share/nvim/plugged')

" plug-in: ui
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'

" plug-in: async
Plug 'neomake/neomake'

" plug-in: navigation
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" plug-in: git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/gitignore'
Plug 'vim-scripts/vcscommand.vim'

" plug-in: editing
Plug 'AndrewRadev/linediff.vim'
Plug 'vim-scripts/Align'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" plug-in: fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" plug-in: ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'ivalkeen/vim-ctrlp-tjump'

Plug 'schickling/vim-bufonly'
Plug 'rking/ag.vim'

" plug-in: syntax check
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'tokorom/syntastic-swiftlint.vim'

" plug-in: misc
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rsi'
Plug 'tyru/open-browser.vim'
Plug 'embear/vim-localvimrc'
Plug 'benmills/vimux'
Plug 'jgdavey/vim-turbux'
Plug 'xolox/vim-misc'

" plug-in: tags
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" plug-in: session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

" plug-in: programming language
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'thoughtbot/vim-rspec'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'lambdatoast/elm.vim'
Plug 'apple/swift', { 'rtp': 'utils/vim' }
Plug 'slim-template/vim-slim'
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/yajs.vim'

call plug#end()
" }}}

" basic settings {{{
set nocompatible
set cursorline
set ttyfast
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
set tags+=.tags
set laststatus=2
set cmdheight=2
set display=lastline
" set lazyredraw
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
set foldenable
set diffopt+=vertical
set wrap
set modelines=5

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
" }}}

" nerdtree {{{
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nr :NERDTreeCWD<CR>
let g:NERDTreeWinSize = 24
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowHidden = 1
" }}}

" fzf {{{
abbrev fzf FZF
noremap <Leader>ff :FZF<CR>
noremap <Leader>fb :Buffers<CR>
"}}}

" 'Find' command cf. https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2#.1lk88kj01
" {{{
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
set grepprg=rg\ --vimgrep
" }}}

" solarized {{{
let g:solarized_termcolors = 256
let g:solarized_term_italics = 1
set background=light
set termguicolors
" colorscheme solarized8_light
" }}}
"
" easytags {{{
let g:easytags_async = 1
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0
" }}}
