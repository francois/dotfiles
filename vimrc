execute pathogen#infect()

" 2 spaces, no tabs, line numbers, search case insensitively
set noswapfile number nowrap ignorecase smartcase wildmenu nobackup showcmd title wildmenu ruler linebreak expandtab modeline shiftwidth=2 softtabstop=2 tabstop=2

" Highlight search results incrementally as the text is typed
set hlsearch incsearch

set scrolloff=3
set wildmode=list:longest,full
set listchars+=precedes:<,extends:>
set modelines=2

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

set shortmess=atI
set visualbell
set noerrorbells

set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

"Default to autoindenting of C like languages
"This is overridden per filetype below
set noautoindent smartindent

" Note if you don't set expandtab, vi will automatically merge
" runs of more than tabstop spaces into hardtabs. Clever but
" not what I usually want.
set shiftround
set nojoinspaces
set smarttab

""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""

"Syntax highlighting if appropriate
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    set incsearch "For fast terminals can highlight search string as you type
endif

if &diff
    "I'm only interested in diff colours
    syntax off
endif

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applies to everything.
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

let mapleader=","
set timeoutlen=230

syntax on
filetype on
filetype indent on

autocmd BufNewFile,BufRead Gemfile setfiletype ruby

autocmd FileType c    setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8 noautoindent smartindent
autocmd FileType make setlocal noexpandtab
autocmd FileType ruby setlocal path=lib/,spec/,test/,bin/,.
autocmd FileType ruby map <Leader>s :w<CR>:!ruby -c %<CR>

" semi-colon removes search highlights
map ; :nohlsearch<CR>

" Auto-center the view on the next search term
nmap n nzz
nmap N Nzz

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
