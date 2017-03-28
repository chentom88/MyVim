execute pathogen#infect()
call pathogen#helptags()

syntax enable

set encoding=utf-8

filetype plugin on
filetype indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set backspace=indent,eol,start

set number
set ruler
set showcmd

set wildmenu

set ignorecase
set showmatch
set hlsearch

set expandtab
set autoindent

let g:go_fmt_command = "goimports"
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

set nocompatible

let mapleader=","

set wildignore=*.swp,*.bak,*.pyc,*.class

set nobackup
set noswapfile

set mouse=a

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Python indentation
au BufNewFile,BufRead *.py
    \ set textwidth=79 |
    \ set fileformat=unix |

let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:SimpylFold_docstring_preview=1

" Fullstack indentation
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" lhs comments
map ,# :s/^/#/<CR>:nohlsearch<CR>
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ,> :s/^/> /<CR>:nohlsearch<CR>
map ," :s/^/\"/<CR>:nohlsearch<CR>
map ,% :s/^/%/<CR>:nohlsearch<CR>
map ,! :s/^/!/<CR>:nohlsearch<CR>
map ,; :s/^/;/<CR>:nohlsearch<CR>
map ,- :s/^/--/<CR>:nohlsearch<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>

augroup filetype
    au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

set laststatus=2
let g:rustfmt_autosave = 1
