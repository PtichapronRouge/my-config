" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
scriptencoding utf-8
set encoding=utf-8

" ================== General Config ===================
"set number relativenumber                     " Relative Line numbers
set number
set backspace=indent,eol,start                " Allow backspace in insert mode
set history=200                               " Store lots of :cmdline history
set laststatus=2                              " Always display the status bar
set showcmd                                   " Show incomplete cmds down the bottom
set showmode                                  " Show current mode down the bottom
set gcr=a:blinkon0                            " Disable cursor blink
"set novisualbell                              " No visual flash sound things
"set noerrorbells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set autoread                                  " Reload files changed outside vim
set clipboard=unnamed                         " Allows the vim clipboard to work with the system keyboard
set colorcolumn=80                            " show a column at 80 chars
set ttimeoutlen=10                            " Fast Esc key
let mapleader=" "                             " Map leader to space bar

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" This makes vim act like all other editors, buffers can exist in the
" background without being in a window.
" http://items.sjbach.com/319/configureing-vim-right
set hidden

" Update to make current version of vim not suck with ruby files due to regex
" engine - tell it to use the old one
set re=1

" ==================== Extension Color ===============

" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
au BufRead,BufNewFile *.grammar set filetype=javascript

"==================== Basic Bindings ================

nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" jk | Escaping!
inoremap jk <Esc>
cnoremap jk <C-c>

" Movement in insert mode
imap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" qq to record, Q to replay
nnoremap Q @q

"==================== Swap Files ====================

set noswapfile
set nobackup
set nowb

" ================== Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ==================== Moving Lines ====================
nmap - :m -2<CR>
nmap = :m +1<CR>

" ===================== Scrolling =====================

set scrolloff=8 	                  	      " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ===================== Search =======================

set incsearch                               " Find the next match as we type
set hlsearch                                " Highlight searches by default
set ignorecase                              " Ignore case when searching...
set smartcase                               " ... Unless we type a capital

" ===================== Indentation ==================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype on
filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·           " Display tabs and trailing spaces visually

" ===================== Wrapping ==================

"set nowrap                                    " Don't wrap lines
set linebreak                                 " Wrap lines at convenient points

" Move normally between wrapped lines
nmap j gj
nmap k gk

" ========================  Buffers ====================

" Use buffers instead of tabs.

" Move to the next buffer
nmap <leader>l :bn<CR>

" Move to the previous buffer
nmap <leader>h :bp<CR>

" Close current buffer but keep split (from vimBufkill)
nmap <leader>w :BD<CR>
nmap <leader>W :BD!<CR>

" To open a new empty buffer
nmap <leader>t :enew<cr>

" switch between the last two files
nnoremap <leader><leader> <c-^>

" ========================  Splits ====================

" Quicker movement between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open new splits
map vv <C-W>v
map ss <C-W>s

" Close Splits
map W  <C-W>q

" Open new split panes to right and bottom - feels more natural
set splitbelow
set splitright

" Window Split Resizing
nnoremap <leader>, :vertical resize +5<CR>
nnoremap <leader>. :vertical resize -5<CR>
nnoremap <leader>= <C-w>=
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>

autocmd VimResized * wincmd = " Automatically resize splits when resizing window

" ====================== Save Settings ==================

" Map save to leader s
map <leader>s :w<CR>
nmap <Leader>r :redraw!<Enter>

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Map Control e to create/open file in current folder
map <C-e> :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

"nnoremap <C-e> :e %:p:h
" Create folders on file save
autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))

" ====================== iTerm Settings ==================

set mouse=a                                   " Mouse scrolling
set ttymouse=xterm2                           " Mouse setting for tmux
set ttymouse=sgr

" ====================== Plugins ========================

" The following 3 lines are required for vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" NerdTree File Browser
Plugin 'scrooloose/nerdtree'

" fzf Fuzy Finder
" super awesome fuzzy finder for all the things (Replaced ctrl P)
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'junegunn/fzf.vim'
" you will need to install the_silver_searcher

" Preview
Plugin 'skywind3000/vim-preview'

" File Actions
Plugin 'tpope/vim-eunuch'                         " Vim wrapper for most common UNIX shell commands

" Text Formatting
Plugin 'tpope/vim-surround'                       " Easy way to swap & remove surrounding quotes or brackets
Plugin 'jiangmiao/auto-pairs'                     " Auto pairs
Plugin 'terryma/vim-multiple-cursors'             " Multiple cursor matching
Plugin 'scrooloose/nerdcommenter'                 " Commenting Shorcuts
"Plugin 'prettier/vim-prettier'                    " Wrapper for prettier
Plugin 'djoshea/vim-autoread'                     " Auto reload unchanged buffers on disk change
Plugin 'luochen1990/rainbow'                      " Rainbow parentheses matching

if has('python3')
  " Snippets [Ultisnips]
  Plugin 'SirVer/ultisnips'                         " Track the engine.
  Plugin 'honza/vim-snippets'                       " Snippets are separated from the engine.

  " AutoCompletion - Requires compiling
  Plugin 'Valloric/YouCompleteMe'                   " Auto Suggestions
endif

" SupeTab - To make snippets and auto complete work nicely together
Plugin 'ervandew/supertab'                        " Use Tab for insert completion needs

" Themes
Plugin 'vim-airline/vim-airline'                  " Bottom Airline Bar
Plugin 'vim-airline/vim-airline-themes'           " Airline themes
Plugin 'morhetz/gruvbox'                          " Gruvbox Theme
"Plugin 'mhartington/oceanic-next'                 " Oceanic Next Colour Scheme

" Git
Plugin 'tpope/vim-fugitive'                       " Git Wrapper
Plugin 'airblade/vim-gitgutter'                   " Git gutter for vim

" Layout
Plugin 'qpkorr/vim-bufkill'                       " Allows for buffer closing without split closing
Plugin 'christoomey/vim-tmux-navigator'           " Vim and tmux harmony

" Markdown
Plugin 'JamshedVesuna/vim-markdown-preview'       " Vim Markdown Generation

" HTML
Plugin 'slim-template/vim-slim.git'               " Syntax Highlighting for Slim
Plugin 'chrisbra/Colorizer'                       " Color Hex codes and color names

" Javascript
Plugin 'pangloss/vim-javascript'                  " Better JS Syntax
Plugin 'mxw/vim-jsx'                              " Better JSX syntax
Plugin 'othree/javascript-libraries-syntax.vim'   " Syntax for JS Libraries
Plugin 'jelera/vim-javascript-syntax'

" JSX / React
Plugin 'mattn/emmet-vim'                          " Expend CSS selectors into JSX

" Liniting
Plugin 'w0rp/ale'                                 " Async Linting tool

" Ruby
Plugin 'tpope/vim-endwise'                        " Automatically add 'end' to things like loops
Plugin 'tpope/vim-rails'                            " Better Rails Syntax
Plugin 'KurtPreston/vim-autoformat-rails'           " Formatting fixes

" Very good Smooth-Scrolling
Plugin 'terryma/vim-smooth-scroll'

" Folds
Plugin 'konfekt/fastfold'
Plugin 'jeetsukumaran/vim-buffergator'

" Clean Diff View
Plugin 'chrisbra/vim-diff-enhanced'

" Relative Line Numbers
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" Search Indexer
Plugin 'google/vim-searchindex'

call vundle#end()


" ====================== Theme Config ==================

syntax enable on
"set termguicolors
"set term=xterm-256color
set termguicolors

"colorscheme onedark

colorscheme special
let g:airline_theme='onedark'



"colorscheme material-monokai
"let g:airline_theme='materialmonokai'
"let g:materialmonokai_subtle_spell=1

"colorscheme quantum
"let g:airline_theme='quantum'
" Gruvbox
"colorscheme gruvbox
"let g:gruvbox_contrast_dark="medium"
"let g:airline_theme='gruvbox'

" Oceanic Next
"colorscheme OceanicNext
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:airline_theme='oceanicnext'

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" set alternate color for modified active/inactive tabs
"autocmd VimEnter *
"   \ let g:airline#themes#materialmonokai#palette.tabline = {
"   \    'airline_tabmod':       ['#f8f8f8','#780000',231,88,''],
"   \    'airline_tabsel': ['#dddddd','#463030',231,52,''],
"   \ } | :AirlineRefresh

" Set vertical bar as cursor in insert mode
if exists('$TMUX')
  let &t_SI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
  let &t_EI = "\<esc>Ptmux;\<esc>\<esc>]50;CursorShape=0\x7\<esc>\\"
else
  let &t_SI = "\<esc>]50;CursorShape=1\x7"
  let &t_EI = "\<esc>]50;CursorShape=0\x7"
endif

" ====================== NERDTree Config ==================

let NERDTreeShowHidden=1                      " Show hidden files
"map <C-f> :NERDTreeToggle<CR>
map <Leader>f :NERDTreeToggle<CR>

" ============= AutoComplete & Snippets Config ===========
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
if has('python3')
  " make YCM compatible with UltiSnips (using supertab)
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  let g:ycm_key_list_accept_completion = ['<C-y>']
  let g:SuperTabDefaultCompletionType = '<C-n>'

  " better key bindings for UltiSnipsExpandTrigger
  "let g:UltiSnipsExpandTrigger="<c-i>"
  "let g:UltiSnipsJumpForwardTrigger="<c-f>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-b>"

  let g:UltiSnipsExpandTrigger = "<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<c-f>"
  let g:UltiSnipsJumpBackwardTrigger = "<c-b>"

  " Auto CSS recommendations for YCM
  let g:ycm_semantic_triggers = {
        \   'css': [ 're!^\s{2}', 're!:\s+' ],
        \ }
endif

" ====================== FZF Config ==================

nnoremap <C-p> :Files<CR>

"nnoremap <C-b> :Buffers<CR>
nnoremap <C-g>c :Commands<CR>

nnoremap <C-g>g :Ag<CR>
nnoremap <C-g>l :BLines<CR>
nnoremap <C-g>c :BCommits<CR>
nnoremap <C-g>b :Buffers<CR>
nnoremap <C-g>p :GFiles<CR>
nnoremap <C-g>? :GFiles?<CR>

" Find word under cursor
nnoremap <Leader>g :Ag <C-R><C-W><CR>

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

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

" ====================== Auto-Pairs Config ==================

let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<C-z>'
let g:AutoPairsMapCh = 0
"====================== GitGutter Config ==================

" Remove gitfutter mappings to free up 'h' key
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=100

" ====================== Markdown Config ==================

" Markdown use github
let vim_markdown_preview_github=1
let vim_markdown_preview_browser="Google Chrome"

" ====================== Javascript Config ==================

let g:jsx_ext_required = 0                     " Allow JSX in normal Javascript files

" ====================== Emmet Config ==================

let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
      \}

" ====================== Ale Config ==================

let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_change = 'never'
let g:airline#extendsions#ale#enabled = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Navigate between errors quickly
" NEVER WANT TO REMAP <C-[> because is is synonymous with mapping <esc>
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

nmap <leader>d <Plug>(ale_fix)

"hi ALEErrorSign guifg=#DF8C8C
"hi ALEWarningSign guifg=#F2C38F
"let g:ale_sign_column_always = 1
"let g:ale_lint_on_save = 1


" ======================= Folds =======================

let g:fastfold_fold_command_suffixes = []
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:markdown_folding = 1
let g:tex_fold_enabled = 1

" ====================== Prettier Config ==================

"let g:prettier#exec_cmd_async = 1
"let g:prettier#config#print_width = 80
"let g:prettier#config#trailing_comma = 'none'
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" ====================== Eunuch Config ==================

nnoremap <Leader>r :Move <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

" ====================== Rainbow Config ==================

let g:rainbow_active = 10

" ====================== MacVim / GUI Changes ==========
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16
set linespace=2

set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\
set noshowmode
" ==================== Custom Functions =================

function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

noremap K :call smooth_scroll#up(3, 6, 1)<CR>
noremap J :call smooth_scroll#down(3, 6, 1)<CR>

let g:airline#extensions#tabline#show_tabs = 0

" ----------------------------------------------------------------------------
" #gi / #gpi | go to next/previous indentation level
" ----------------------------------------------------------------------------
function! s:go_indent(times, dir)
  for _ in range(a:times)
    let l = line('.')
    let x = line('$')
    let i = s:indent_len(getline(l))
    let e = empty(getline(l))

    while l >= 1 && l <= x
      let line = getline(l + a:dir)
      let l += a:dir
      if s:indent_len(line) != i || empty(line) != e
        break
      endif
    endwhile
    let l = min([max([1, l]), x])
    execute 'normal! '. l .'G^'
  endfor
endfunction
nnoremap <silent> gi :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> gpi :<c-u>call <SID>go_indent(v:count1, -1)<cr>

" ----------------------------------------------------------------------------
" <Leader>?/! | Google it / Feeling lucky
" ----------------------------------------------------------------------------

function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('xdg-open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv

" Using arrow to resize
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

" ======================= Debug ====================
"
noremap <Leader>y "+y
noremap <Leader>p "+p
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
