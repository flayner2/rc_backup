" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins
" Auto-completion engine 
Plug 'valloric/youcompleteme'
" Gruvbox colorscheme
Plug 'morhetz/gruvbox'
" File and text search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
" File system explorer
Plug 'scrooloose/nerdtree'
" Git utilities
Plug 'tpope/vim-fugitive'
" Quote/bracket/parenthesis autocompletion
Plug 'Raimondi/delimitMate'
" General syntax checking
"Plug 'vim-syntastic/syntastic'
" Python functionality bundle
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Configurations

" Always show line numbers
set number
" Always highlight search results
set hlsearch

" Gruvbox setup and config
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'
set bg=dark

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" YCM Options
" this is actually not an YCM option, but works with it
" disabling preview window for completions
set completeopt-=preview

" Syntastic options
" Set statusline flags for errors
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Always stick any detected errors into the |location-list|
"let g:syntastic_always_populate_loc_list = 0
" Automatically open the |location-list| when errors are found
"let g:syntastic_auto_loc_list = 0
" Check errors when openning and saving files
"let g:syntastic_check_on_open = 0
" Check errors when saving and quitting (false)
"let g:syntastic_check_on_wq = 1
" A list of syntax checking engines for python
"let g:syntastic_python_checkers = ["pylama"]
" Configuring pylama
"let g:syntastic_python_pylama_args = "-o /home/maycon/.config/pylama.ini"

" PythonMode options
" Setup max line length
let g:pymode_options_max_line_length = 100
" Auto open quickfix window if any errors have been found
let g:pymode_lint_cwindow = 0
" Turn off plugin's warnings
let g:pymode_warnings = 1
" Highlight print as a function
let g:pymode_syntax_print_as_function = 1
" Highlight space's errors
let g:pymode_syntax_space_errors = 0
" Lint on save
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
" Enable rope autocompletion
let g:pymode_rope = 0
" Disable lookup for .ropeproject in parent dirs
let g:pymode_rope_lookup_project = 0
" Disable autoinsert of completions
set completeopt=menuone,noinsert
" Turn on code completion
let g:pymode_rope_completion = 0
" Autocompletion when typing a period
let g:pymode_rope_complete_on_dot = 0

" Custom commands

" Nerdtree
" Open
map <C-n> :NERDTreeToggle<CR>
" Find file
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

" Window navigation
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Go to definition
nnoremap <Leader>gd :GoDef<Enter>

" YCM
" GoTo
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Clear search highlighting
nnoremap <silent> ,<space> :set hlsearch! hlsearch?<CR>

" Syntastic
" Open |location-list|
nnoremap <silent> <leader>ll :Errors<CR>
