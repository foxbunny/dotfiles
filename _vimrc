"Turn off vi compatibility
set nocompatible

"UNIX line endings
set fileformat=unix

"UTF-8 encoding
set encoding=utf-8

"Use syntax highlighting
syntax on

"Show the right margin
set showtabline=2

"Enable backspace functionality (required under Windows)
set backspace=2

"Enable mouse in CLI vim
set mouse=a

"Pathogen
call pathogen#infect()

"Enable filetype plugins and indentation plugins
set filetype=on
filetype plugin on
filetype indent on

let mapleader=","
let g:mapleader=","

" 256 color support in CLI
set t_Co=256

" Color scheme for CLI vim
colorscheme candycode

"Startup window size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
  set guioptions-=e
  set guifont=DejaVu\ Sans\ Mono\ 10
  set lines=999 columns=999

  "Enable Shift+Ins behavior
  map  <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Highlight 80 columns
set colorcolumn=80

"Spelling mappings: F8 on / F9 off
map <F8> <Esc>:setlocal spell spelllang=en_us<CR>
map <F9> <Esc>:setlocal nospell<CR>

"Run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> <Esc>:w!<CR>:!php %<CR>

"PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> <Esc>:w!<CR>:!php -l %<CR>

"Tab settings
set ai
set ts=4
set sts=4
set et
set sw=4
set textwidth=79

"Show line number
set number

"Show matching braces
set showmatch

"Case insensitive search on lowercase keywords
set ignorecase
set smartcase

"Autocomplete options
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xhtml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

"HTML tab settings (2-space tabs, no right margin)
autocmd FileType html setlocal sw=2
autocmd FileType html setlocal ts=2
autocmd FileType html setlocal sts=2
autocmd FileType html setlocal textwidth=0
"XHTML tab settings (2-space tabs, no right margin)
autocmd FileType xhtml setlocal sw=2
autocmd FileType xhtml setlocal ts=2
autocmd FileType xhtml setlocal sts=2
autocmd FileType xhtml setlocal textwidth=0
"CSS tab settings (2-space tabs, 79chr right margin)
autocmd FileType css setlocal sw=2
autocmd FileType css setlocal ts=2
autocmd FileType css setlocal sts=2
"JavaScript tab settings (2-space tabs, 79chr right margin)
autocmd FileType javascript setlocal textwidth=0
autocmd FileType javascript setlocal sw=2
autocmd FileType javascript setlocal ts=2
autocmd FileType javascript setlocal sts=2
"Jade tab settings (2-space tabs, no right margin)
autocmd FileType jade setlocal textwidth=0
autocmd FileType jade setlocal sw=2
autocmd FileType jade setlocal ts=2
autocmd FileType jade setlocal sts=2

"Incremental search
set incsearch

"Buffer autocommands
autocmd BufRead *.py setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"Unrecognized extensions
autocmd BufNewFile,BufRead *.less setlocal ft=css
autocmd BufNewFile,BufRead *.tpl setlocal ft=html
autocmd BufNewFile,BufRead *.xul  setlocal ft=xul 

"Higlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

"Map NERDTree to <leader>p
nmap <silent> <leader>` :NERDTreeToggle<CR>  

"Use space to fold or unfold
nnoremap <space> za

"Folding config
set foldmethod=syntax
set foldlevelstart=1

"Enable folding in JavaScript
let javascript_fold=1

"Settings recommended by Vim-LaTeX
set grepprg=grep\ -nH\ $*
let g:text_flavor='latex'
autocmd FileType tex setlocal sw=2
autocmd FileType tex setlocal ts=2
autocmd FileType tex setlocal sts=2
autocmd FileType plaintex setlocal sw=2
autocmd FileType plaintex setlocal ts=2
autocmd FileType plaintex setlocal sts=2

"Space/Tab conversion
:command! -range=% -nargs=0 Tab2Space execute "<line1>,<line2>s/^\\t\\+/\\=substitute(submatch(0), '\\t', repeat(' ', ".&ts."), 'g')"
:command! -range=% -nargs=0 Space2Tab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

"Search in files using Fgrep command
:command! -nargs=+ Fgrep execute "noautocmd silent lvimgrep /<args>/gj **" | lopen 20

"Editing mutt email
autocmd BufRead ~/tmp/mutt-* setlocal tw=72

"Ctags generator
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

"Ctags
set tags+=~/.vim/tags/stl

"C++ omnicomplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
set completeopt=menuone,menu,longest,preview

"Tab navigation
noremap <silent> <leader><Tab> :tabn<CR>
noremap <silent> <leader><S-Tab> :tabp<CR>
noremap <silent> <C-t> :tabnew<CR>:FufFile<CR>
inoremap <silent> <C-t> <Esc>:tabnew<CR>:FufFile<CR>

"Snap open
noremap <silent> <leader>o :FufFile<CR>

"Custom status line
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %=\ L:%l\,%L\ C:%c%V\ %P\ %{fugitive#statusline()}
set laststatus=2

"Invisible characters
noremap <silent><leader>l :set list!<CR>
set listchars=tab:⇥\ ,eol:↵
set nolist "Don't show by default

"Session management
nmap <silent><leader>ss <Esc>:source ~/.vim_sessions/default.vim<CR>
function! SaveCurrentSession()
    if v:this_session != ""
        exe "mksession! " . v:this_session
    else
        exe "mksession! ~/.vim_sessions/default.vim"
    endif
endfunction
autocmd VimLeave * call SaveCurrentSession()

"Clean up trailing spaces
nnoremap <silent> <leader><Backspace> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"Save undo history
set undodir=~/.vim_undo
set undofile

"Graphical undo (gundo)
nnoremap <silent><leader>u <Esc>:GundoToggle<CR>

"JavaScript: go to line above an insert blank line
autocmd FileType javascript inoremap <buffer> <C-Return> <CR><Esc>O

"Searching
set ignorecase
set smartcase
set incsearch
