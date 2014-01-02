"Turn off vi compatibility
set nocompatible

"UNIX line endings
set fileformat=unix
set fileformats=unix,dos
set fileencodings=utf8,latin1

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
  if has("unix")
    set guifont="DejaVu Sans Mono 10"
  else
    set guifont=DejaVu_Sans_Mono:h10:cANSI
  endif
  set lines=999 columns=999

  "Enable Shift+Ins behavior
  map  <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
endif

" Color scheme for CLI vim
colorscheme darkspectrum

" Highlight 80 columns
set colorcolumn=80

"Spelling mappings: F8 on / F9 off
map <F8> <Esc>:setlocal spell spelllang=en_us<CR>
map <F9> <Esc>:setlocal nospell<CR>

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
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType htmldjango setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xhtml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

"HTML tab settings (4-space tabs, no right margin)
autocmd FileType html setlocal sw=4
autocmd FileType html setlocal ts=4
autocmd FileType html setlocal sts=4
autocmd FileType html setlocal textwidth=0
"Django HTML tab settings (4-space tabs, no right margin)
autocmd FileType htmldjango setlocal sw=4
autocmd FileType htmldjango setlocal ts=4
autocmd FileType htmldjango setlocal sts=4
autocmd FileType htmldjango setlocal textwidth=0
"XHTML tab settings (4-space tabs, no right margin)
autocmd FileType xhtml setlocal sw=4
autocmd FileType xhtml setlocal ts=4
autocmd FileType xhtml setlocal sts=4
autocmd FileType xhtml setlocal textwidth=0
"CSS tab settings (4-space tabs, no right margin)
autocmd FileType css setlocal sw=4
autocmd FileType css setlocal ts=4
autocmd FileType css setlocal sts=4
autocmd FileType css setlocal textwidth=0
"JavaScript tab settings (2-space tabs, 79chr right margin)
autocmd FileType javascript setlocal sw=2
autocmd FileType javascript setlocal ts=2
autocmd FileType javascript setlocal sts=2
"CoffeeScript tab settings (2-space tabs, 79chr right margin)
autocmd FileType coffee setlocal sw=2
autocmd FileType coffee setlocal ts=2
autocmd FileType coffee setlocal sts=2
"Literate CoffeeScript tab settings (2-space tabs, 79chr right margin)
autocmd FileType litcoffee setlocal sw=2
autocmd FileType litcoffee setlocal ts=2
autocmd FileType litcoffee setlocal sts=2
"LiveScript
autocmd FileType ls setlocal sw=2
autocmd FileType ls setlocal ts=2
autocmd FileType ls setlocal sts=2
"BASH script settings (2-space tabs, no right margin)
autocmd FileType sh setlocal textwidth=0
autocmd FileType sh setlocal sw=4
autocmd FileType sh setlocal ts=4
autocmd FileType sh setlocal sts=4
"JST/EJS tab settings (2-space tabs, no right margin)
autocmd FileType jst setlocal textwidth=0
autocmd FileType jst setlocal sw=2
autocmd FileType jst setlocal ts=2
autocmd FileType jst setlocal sts=2
"Jade tab settings (2-space tabs, no right margin)
autocmd FileType jade setlocal textwidth=0
autocmd FileType jade setlocal sw=2
autocmd FileType jade setlocal ts=2
autocmd FileType jade setlocal sts=2
"Erlang tab settings (2-space tabs, no right margin)
autocmd FileType erlang setlocal textwidth=79
autocmd FileType erlang setlocal sw=4
autocmd FileType erlang setlocal ts=4
autocmd FileType erlang setlocal sts=4
"SCSS/SASS tab settings (2-space tabs, no right margin)
autocmd FileType scss setlocal textwidth=0
autocmd FileType scss setlocal sw=2
autocmd FileType scss setlocal ts=2
autocmd FileType scss setlocal sts=2
"Underscore template
autocmd FileType underscore_template setlocal textwidth=0
autocmd FileType scss setlocal sw=2
autocmd FileType scss setlocal ts=2
autocmd FileType scss setlocal sts=2

"Incremental search
set incsearch

"Buffer autocommands
autocmd BufRead *.py setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead volofile setlocal ft=javascript

"Unrecognized extensions
autocmd BufNewFile,BufRead,BufWrite *.less setlocal ft=css
autocmd BufNewFile,BufRead,BufWrite *.jstmpl setlocal ft=jst
autocmd BufNewFile,BufRead,BufWrite *.xul  setlocal ft=xul 
autocmd BufNewFile,BufRead,BufWrite *.tpl setlocal ft=underscore_template
autocmd BufNewFile,BufRead,BufWrite *.xml setlocal ft=underscore_template
autocmd BufNewFile,BufRead,BufWrite *.ejs setlocal ft=jst

"Higlight current line only in insert mode
autocmd InsertLeave * set nocursorline
autocmd InsertEnter * set cursorline

"Map NERDTree to <leader>p
nmap <silent> <leader>` :NERDTreeToggle<CR>  
nmap <silent> <leader>f :NERDTreeFind<CR>

"NERDTree ignores
let NERDTreeIgnore = ['\.pyc$']

"Ctrl-P ignores
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache)$',
            \ 'file': '\v\.(exe|so|dll|pyc|swp|swo)$',
            \ }

"Toggle rainbow parens
nmap <silent> <leader>r :RainbowParenthesesToggle<CR>
nmap <silent> <leader>( :RainbowParenthesesLoadRound<CR>

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

"Search for TODO items
nnoremap <silent> <leader>t :Fgrep \\(TODO\\\|FIXME\\\|XXX\\)<CR>

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

"-----------------"
" LEADER COMMANDS "
"-----------------"

"Tab navigation
noremap <silent> <leader><Tab> :tabn<CR>
noremap <silent> <leader><S-Tab> :tabp<CR>

"CtrlP shortcuts
noremap <silent> <C-T> :tabnew<CR>:CtrlP<CR>
inoremap <silent> <C-T> <Esc>:tabnew<CR>:CtrlP<CR>
noremap <silent> <leader>o :CtrlP<CR>

"Buffer navigation
noremap <silent> <leader>j <C-w>j
noremap <silent> <leader>k <C-w>k
noremap <silent> <leader>h <C-w>h
noremap <silent> <leader>l <C-w>l

"Splitting
noremap <silent> <leader>v :vsplit<CR>
noremap <silent> <leader>p :split<CR>

"Quick save
noremap <silent> <leader>w :up<CR>

"Quit
noremap <silent> <leader>q :q<CR>

"Django HTML template
noremap <silent> <leader>d :set ft=htmldjango<CR>

"Load default session
nmap <silent> <leader>ss <Esc>:source ~/.vim_sessions/default.vim<CR>

"Toggle display of invisible characters
noremap <silent> <leader>\ :set list!<CR>

"Custom status line
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %=\ L:%l\,%L\ C:%c%V\ %P\ %{fugitive#statusline()}
set laststatus=2

"Invisible characters
set listchars=tab:⇥\ ,eol:↵
set nolist "Don't show by default

"Session management
function! SaveCurrentSession()
    if v:this_session != ""
        exe "mksession! " . v:this_session
    else
        exe "mksession! ~/.vim_sessions/default.vim"
    endif
endfunction
autocmd VimLeave * call SaveCurrentSession()

"Clean up trailing spaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <leader><Backspace> :call <SID>StripTrailingWhitespaces()<CR>
autocmd BufWritePre *.py,*.jstmpl,*.css,*.coffee,*.ls :call <SID>StripTrailingWhitespaces()

"Convert to UNIX line endings
function! ConvertToUnix()
    exe "update"
    exe "e ++ff=dos"
    exe "setlocal ff=unix"
    exe "w"
endfunction

"Convert to DOS line endings
function! ConvertToDos()
    exe "update"
    exe "e ++ff=unix"
    exe "setlocal ff=dos"
    exe "w"
endfunction

nnoremap <silent> <leader>00 :call ConvertToUnix()<CR>
nnoremap <silent> <leader>09 :call ConvertToDos()<CR>

" Virutalenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'Scripts\\activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"Save undo history
set undodir=~/.vim_undo
set undofile

"Graphical undo (gundo)
nnoremap <silent><leader>u <Esc>:GundoToggle<CR>

"JavaScript: go to line above an insert blank line
autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>

"Bash insert double squares for conditionals
autocmd FileType sh inoremap [[<Space> [[<Space><Space>]]<Esc>hhi

"Searching
set ignorecase
set smartcase
set incsearch

"Hack to get around differences between X and BASH envs
let $PATH=$PATH . ":~/local/bin"

"Ropevim
let ropevim_vim_completion = 1
let ropevim_extended_complete = 0
let ropevim_goto_def_newwin = 1
autocmd FileType python setlocal omnifunc=RopeCompleteFunc

"Auto-fix typos
inoremap requri requir
inoremap yoru your

