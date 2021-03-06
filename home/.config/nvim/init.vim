" plug-in loading {{{
call plug#begin('~/.local/share/nvim/plugged')

" plug-in: airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" plug-in: settings
Plug 'tpope/vim-sensible'
Plug 'embear/vim-localvimrc'

" plug-in: colorscheme
Plug 'lifepillar/vim-solarized8'
Plug 'icymind/NeoSolarized'

" plug-in: command
Plug 'tpope/vim-rsi'

" plug-in: async
Plug 'tpope/vim-dispatch', { 'on': 'Dispatch' }
Plug 'skywind3000/asyncrun.vim'
" Plug 'w0rp/ale'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" plug-in: navigation
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'jremmen/vim-ripgrep'

" plug-in: git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/gitignore'
Plug 'vim-scripts/vcscommand.vim'
Plug 'lambdalisue/gina.vim'

" plug-in: editing
Plug 'AndrewRadev/linediff.vim'
Plug 'vim-scripts/Align'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tyru/open-browser.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tyru/qfhist.vim'
Plug 'szw/vim-maximizer'
Plug 'junegunn/vim-emoji'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'chrisbra/csv.vim'

" plug-in: fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" plug-in: tmux
Plug 'benmills/vimux'

" plug-in: buffers/tabs
Plug 'mkitt/tabline.vim'
Plug 'schickling/vim-bufonly'
Plug 'szw/vim-maximizer'

" plug-in: quickfix
Plug 'tyru/qfhist.vim'

" plug-in: tags
Plug 'majutsushi/tagbar', { 'on': ['Tagbar', 'TagbarToggle'] }

" plug-in: session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

" plug-in: programming language
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'lambdatoast/elm.vim'
Plug 'slim-template/vim-slim'
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/yajs.vim'
Plug 'digitaltoad/vim-pug'
Plug 'thalesmello/lkml.vim'
Plug 'burner/vim-svelte'
Plug 'stephpy/vim-yaml'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'

" plug-in: performance
Plug 'hyiltiz/vim-plugins-profile'

call plug#end()
" }}}

" basic settings {{{
set nocompatible
set cursorline
set cc=
set ttyfast
set hidden
set number
set ruler
set backspace=indent,eol,start
set history=1000
if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus,unnamed
else
  set clipboard& clipboard+=unnamed
endif
set showcmd
set showmode
set visualbell t_vb=
set autoread
set encoding=utf-8
set virtualedit+=block
set tags+=.tags,.git/tags,.svn/tags
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
set complete+=k
set ignorecase
set smartcase
set incsearch
set hlsearch
set viminfo='100,f1
set foldmethod=marker
set foldopen+=jump
set foldnestmax=10
set foldlevelstart=3
set nofoldenable
set diffopt+=vertical
set wrap
set modelines=3
set sh=/usr/local/bin/zsh
set notimeout
set ambiwidth=double
set matchtime=3
set textwidth=0
" }}}

" solarized {{{
set background=dark
let g:solarized_termcolors=256
set termguicolors
colorscheme NeoSolarized
hi Normal ctermbg=NONE
" }}}

" auto command {{{
" shift the cursor to the postition of last time the file was open
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" Syntax
autocmd BufNewFile,BufRead justfile  setfiletype make
autocmd BufNewFile,BufRead *.rss     setfiletype xml
autocmd BufNewFile,BufRead *.thtml   setfiletype php
autocmd BufNewFile,BufRead *.tpl     setfiletype smarty
autocmd BufNewFile,BufRead *.es6     setfiletype javascript
autocmd BufNewFile,BufRead *.jsx     setfiletype javascript
autocmd BufNewFile,BufRead *_spec.rb compiler    rspec

autocmd InsertEnter * if !exists('w:last_fdm')
            \| let w:last_fdm=&foldmethod
            \| setlocal foldmethod=manual
            \| endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm')
            \| let &l:foldmethod=w:last_fdm
            \| unlet w:last_fdm
            \| endif
autocmd QuickfixCmdPost vimgrep copen
autocmd QuickfixCmdPost grep copen

augroup quickfix
  autocmd!
  autocmd FileType qf setlocal nowrap
augroup END
" }}}

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
nnoremap K :grep "\b<C-R><C-W>\b"<CR>:cw<CR>
tnoremap <silent> <ESC> <C-\><C-n>
nnoremap <Leader>q] :cn<CR>
nnoremap <Leader>q[ :cp<CR>
nnoremap <Leader>g :cp<CR>
nnoremap <Leader>q[ :cp<CR>
" }}}

" nerdtree {{{
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nr :NERDTreeCWD<CR>
let g:NERDTreeWinSize = 24
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowHidden = 1
" }}}

" AsyncRun {{{
let g:asyncrun_open = 8
" }}}

" fzf {{{
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_preview_window = ''
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_prefer_tmux = 1
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_history_dir = '~/.local/share/fzf-history'

function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

noremap <C-p>      :GFiles<CR>
noremap <Leader>p  :GFiles<CR>
noremap <Leader>ff :GFiles<CR>
noremap <Leader>fd :FZF<CR>
noremap <Leader>fb :Buffers<CR>
noremap <Leader>fw :Windows<CR>
noremap <Leader>fc :Commits<CR>
noremap <Leader>ft :BTags<CR>

nnoremap <c-]> :call fzf#vim#tags(expand('<cword>'))<cr>
"}}}

" 'Find command' {{{
" cf. https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2#.1lk88kj01
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-messages --no-heading --fixed-strings --ignore-case --no-ignore --hidden --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* Find
set grepprg=git\ grep\ -I\ --line-number
" }}}

" solarized {{{
let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
" }}}

" fugitive {{{
command! Gd :Gdiff
command! Gc :Gcommit
command! Gw :Gwrite
command! Gs :Gstatus
" remove fugitive buffer when buffer is no longer needed
au BufReadPost fugitive://* set bufhidden=delete
" }}}

" gitv {{{
let g:Gitv_OpenHorizontal = 0
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

" ale {{{
" let g:ale_fixers = {
" \   'javascript': [
" \       'prettier',
" \   ]
" \}
" let g:ale_fix_on_save = 1
" let g:ale_lint_on_enter = 0
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" let g:ale_set_loclist = 0
" }}}

" emmet {{{
let g:user_emmet_leader_key = '<c-t>'
" }}}

" localvimrc {{{
let g:localvimrc_ask = 0
" }}}

" expand-region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}

" tagbar {{{
let g:tagbar_sort = 0
" }}}

" vimux {{{
let VimuxUseNearest = 1
map <Leader>re :call VimuxRunCommand('rspec -fd ' . bufname("%") . ':' . line("."))<CR>
map <Leader>rk :call VimuxRunCommand('rspec -fd ' . bufname("%"))<CR>
map <Leader>ro :call VimuxRunCommand('rubocop -a ' . bufname("%"))<CR>
map <Leader>rl :call VimuxRunLastCommand()<CR>
map <Leader>ri :call VimuxPromptCommand()<CR>
" }}}

" terminal color {{{
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'
" }}}

" airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tagbar#enabled = 0
" }}}

" maximuizer {{{
nnoremap <Leader>m :MaximizerToggle<CR>
" }}}
