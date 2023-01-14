set nocompatible                " required
filetype off                    " required
set splitbelow
set splitright
set nu
set clipboard=unnamed

" more powerful backspacing
set backspace=indent,eol,start  

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" so you can see the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" adding proper PEP 8 indentation for python files
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" adding proper indentation for javascript, html and css files
au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" flagging unnecessary whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" The first line ensures that the auto-complete window goes away when you’re done with it, 
" and the second defines a shortcut for goto definition.

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" making our code look pretty.
let python_highlight_all=1
syntax on

" set encoding to
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Alows us to set which scheme to use based upon the vim mode.
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] 

filetype plugin indent on    " required