set nocompatible                " required
filetype off                    " required
set splitbelow
set splitright
set nu
set clipboard=unnamed
set cursorline


let &t_SI = "\e[5 q"
let &t_EI = "\e[5 q"
" Emmet settings
let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."  <head>\n"
\              ."    <meta charset=\"${charset}\">\n"
\              ."    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n"
\              ."    <title></title>\n"               
\              ."    <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js\" integrity=\"sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r\" crossorigin=\"anonymous\"></script>\n"
\              ."    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js\" integrity=\"sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+\" crossorigin=\"anonymous\"></script>\n"
\              ."  </head>\n"
\              ."  <body>\n\t\t${child}|\n"
\              ."     \n"
\              ."  </body>\n"
\              ."</html>",
\    },
\  },
\}

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

" Python PEP 8 Indentation settings
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" adding proper indentation for javascript, html and css files
au BufNewFile, BufRead *.js,*.html,*.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" flagging unnecessary whitespace for all programming languages.
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h,*.go
    \ match BadWhitespace /\s\+$/

" Enable HTML Templates for Go
au BufRead,BufNewFile *.gohtml
    \ set filetype=gohtmltmpl

" Pear of Ducks Ansible Vim Settings
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
let g:ansible_extra_keywords_highlight = 1
let g:ansible_extra_keywords_highlight_group = 'Constant'
let g:ansible_loop_keywords_highlight = 'Constant'
let g:ansible_ftdetect_filename_regex = '\v(playbook|site|main|local|requirements)\.ya?ml$'
let g:ansible_yamlKeyName = 'yamlKey'


" Vim-Go Settings
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

let g:go_test_timeout = '10s'
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 0
let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_def_mode = 'godef'
let g:go_decls_includes = "func,type"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_play_open_browser = 1
let g:go_play_browser_command = "chrome"

autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd BufNewFile,BufRead *.go
    \ setlocal noexpandtab tabstop=4 shiftwidth=4

" Vim-Go Functions
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

"RustVIM
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
let g:rust_fold = 1    
let g:rust_bang_comment_leader = 1
let g:rustfmt_command = 'rustfmt'
let g:rust_playpen_url = 'https://play.rust-lang.org/'
let g:syntastic_rust_checkers = ['cargo']
let g:rust_cargo_avoid_whole_workspace = 0

"YouCompleteMe Settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" making our code look pretty.
let python_highlight_all=1
syntax on

" Ansible settings
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
let g:ansible_extra_keywords_highlight = 1
let g:ansible_extra_keywords_highlight_group = 'Constant'
let g:ansible_loop_keywords_highlight = 'Constant'
let g:ansible_ftdetect_filename_regex = '\v(playbook|site|main|local|requirements)\.ya?ml$'

let g:solarized_termcolors=256

if strftime("%H") >= 0 && strftime("%H") <= 5
        colorscheme Base2Tone_MorningLight
elseif strftime("%H") >= 6 && strftime("%H") <= 17
        colorscheme Base2Tone_MorningLight
elseif strftime("%H") >= 18 && strftime("%H") <= 23
        colorscheme Base2Tone_EveningDark
endif

" NERDTree Settings.
let NERDTreeIgnore=['\.pyc$', '\~$']
filetype plugin indent on    " required
set completeopt-=preview
