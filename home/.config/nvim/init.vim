" plug-in loading {{{
call plug#begin('~/.local/share/nvim/plugged')

" plug-in: ui
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" plug-in: settings
Plug 'tpope/vim-sensible'
Plug 'embear/vim-localvimrc'

" plug-in: colorscheme
Plug 'lifepillar/vim-solarized8'

" plug-in: command
Plug 'tpope/vim-rsi'

" plug-in: async
Plug 'neomake/neomake'
Plug 'tpope/vim-dispatch'

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
Plug 'tyru/open-browser.vim'

" plug-in: fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" plug-in: ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'ivalkeen/vim-ctrlp-tjump'

" plug-in: grep
Plug 'rking/ag.vim'

" plug-in: syntax check
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'tokorom/syntastic-swiftlint.vim'
Plug 'benjie/neomake-local-eslint.vim'

" plug-in: tmux
Plug 'benmills/vimux'
"
" plug-in: misc
Plug 'xolox/vim-misc'

" plug-in: buffers/tabs
Plug 'mkitt/tabline.vim'
Plug 'schickling/vim-bufonly'
Plug 'szw/vim-maximizer'

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
set clipboard+=unnamedplus
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
set foldlevelstart=1
set foldenable
set diffopt+=vertical
set wrap
set modelines=3
set background=light
let g:solarized_termcolors=256
colorscheme solarized8_light
set termguicolors
hi Normal ctermbg=NONE
set sh=zsh
" }}}

" auto command {{{
if has("autocmd")
  " shift the cursor to the postition of last time the file was open
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  " Syntax
  autocmd FileType make       setlocal ts=8 sts=8 sw=8 noet
  autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType php        setlocal ts=4 sts=4 sw=4 noet foldmethod=syntax
  autocmd FileType smarty     setlocal ts=2 sts=2 sw=2 noet foldmethod=indent
  autocmd FileType java       setlocal ts=4 sts=4 sw=4 et   foldmethod=syntax
  autocmd FileType vim        setlocal ts=2 sts=2 sw=2 et
  autocmd FileType html       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType css        setlocal ts=2 sts=2 sw=2 et   foldmethod=indent
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 et   foldmethod=syntax
  autocmd FileType sh         setlocal ts=2 sts=2 sw=2 et
  autocmd FileType ruby       setlocal ts=2 sts=2 sw=2 et   foldmethod=syntax re=1
  autocmd FileType sql        setlocal ts=4 sts=4 sw=4 noet foldmethod=indent
  autocmd FileType swift      setlocal ts=4 sts=4 sw=4 et   foldmethod=syntax
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
endif
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
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>
tnoremap <silent> <ESC> <C-\><C-n>
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
noremap <Leader>fw :Windows<CR>
noremap <Leader>fc :Commits<CR>
noremap <Leader>ft :BTags<CR>
"}}}

" 'Find command' {{{
" cf. https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2#.1lk88kj01
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
set grepprg=rg\ --vimgrep
" }}}

" easytags {{{
let g:easytags_async = 1
let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0
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
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" }}}

" ag {{{
abbrev ag Ag
noremap <Leader>aa :Ag -i<space>
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
" cabbrev git Git
" cabbrev gitv Gitv
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
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_loc_list_height = 6
" let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_scss_checkers = ['scss_lint']
" let g:syntastic_swift_checkers = ['swiftlint']
" let g:syntastic_mode_map = {
"   \ 'mode': 'passive',
"   \ 'active_filetypes': ['ruby', 'javascript', 'scss', 'swift'],
"   \ 'passive_filetypes': []
"   \ }
" let g:syntastic_ignore_files = ['schema\.rb']
" }}}

" neomake {{{
autocmd! BufRead,BufWritePost * Neomake
let g:neomake_ruby_makers = ['mri', 'rubocop']
let g:neomake_javascript_makers = ['eslint']
let g:neomake_scss_makers = ['scss_lint']
let g:neomake_swift_makers = ['swiftlint']
let g:neomake_error_sign = {'text': '>>', 'texthl': 'Error'}
let g:neomake_warning_sign = {'text': '>>',  'texthl': 'Todo'}
" }}}

" emmet {{{
let g:user_emmet_leader_key = '<c-t>'
" }}}

" airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'base16'
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
map <Leader>rs :call VimuxRunCommand('clear; RAILS_ENV=test ./bin/rspec -fd ' . bufname("%"))<CR>
map <Leader>rl :call VimuxRunLastCommand()<CR>
map <Leader>ri :call VimuxPromptCommand()<CR>
" }}}
