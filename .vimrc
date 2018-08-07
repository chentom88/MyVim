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

"-----------------------------------------------------------------------------
" VIM-GO CONFIG
"-----------------------------------------------------------------------------
let g:go_fmt_command = "goimports"

" highlight go-vim
highlight goSameId term=bold cterm=bold ctermbg=250 ctermfg=239
set updatetime=100 " updates :GoInfo faster

" vim-go command shortcuts
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t :wa<CR>:!clear;go test -v ./%:h<CR>
autocmd FileType go nmap <leader>a <Plug>(go-alternate-edit)
autocmd FileType go nmap <leader>d :GoDeclsDir<CR>
autocmd FileType go nmap <leader>g <Plug>(go-generate)
autocmd FileType go nmap <leader>? :GoDoc<CR>
autocmd FileType go nmap <leader>n :GoRename<CR>
autocmd FileType go nmap <leader>l :GoMetaLinter<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

function! s:toggle_coverage()
    call go#coverage#BufferToggle(!g:go_jump_to_error)
    highlight ColorColumn ctermbg=235
    highlight NonText ctermfg=239
    highlight SpecialKey ctermfg=239
    highlight goSameId term=bold cterm=bold ctermbg=250 ctermfg=239
endfunction

autocmd FileType go nmap <leader>c :<C-u>call <SID>toggle_coverage()<CR>

" This will add new commands, called :A, :AV, :AS and :AT. Here :A works just
" like :GoAlternate, it replaces the current buffer with the alternate file.
" :AV will open a new vertical split with the alternate file. :AS will open
" the alternate file in a new split view and :AT in a new tab.
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
