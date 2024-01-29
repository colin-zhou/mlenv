set nocompatible              " be iMproved, required
filetype off                  " required
" color molokai
set wildmenu
" do not redraw panel
set lazyredraw
" search as entered
set incsearch
" highlight matchs
set hlsearch

" set the runtime path to include Vundle and initialize
if version >= 500
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    "git operation wrapper
    " Plugin 'airblade/vim-gitgutter'
    "syntax of javascript
    " Plugin 'pangloss/vim-javascript'
    "html label shortcut
    " Plugin 'tpope/vim-surround'
    "html5 editor
    " Plugin 'mattn/emmet-vim'
	" commentary
	Plugin 'tpope/vim-commentary'
    " markdown
    Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
    " kdb
    Plugin 'katusk/vim-qkdb-syntax'
    " terminal mode
    Plugin 'jnurmine/Zenburn'
    " color scheme
    Plugin 'altercation/vim-colors-solarized'
    " flake-8
    Plugin 'nvie/vim-flake8'
    " indent help
    Plugin 'vim-scripts/indentpython.vim'
    " code fold
    " Plugin 'tmhedberg/SimpylFold'
    "html edit
    Plugin 'VundleVim/Vundle.vim'
    "youcompleteme
    Plugin 'Valloric/YouCompleteMe'
    "tree nav bar
    Plugin 'scrooloose/nerdtree'
    "comment prompt or corresponding operation
    Plugin 'scrooloose/nerdcommenter'
    "bottom bar show the mode, line and other information
    Plugin 'lokaltog/vim-powerline'
    "basically for c++ syntax check show the error alert
    "Plugin 'scrooloose/syntastic'
    "fuzzy find needed file plugin, pretty cool
    Plugin 'kien/ctrlp.vim'
    "fuzzy find function in file
    Plugin 'tacahiroy/ctrlp-funky'
    "lean & mean status/tabline for vim that's light as air
    "Integrates with a variety of plugins
    Plugin 'bling/vim-airline'
    "Remove the space at end line
    Plugin 'bronson/vim-trailing-whitespace'
    Plugin 'majutsushi/tagbar'
    "prompt input based on context
    Plugin 'ervandew/supertab'
    "indent virtual guide line
    Plugin 'nathanaelkane/vim-indent-guides'
    "scope jump configuration
    Plugin 'brookhong/cscope.vim'
    "python-mode is a ide for developing python
    "Plugin 'klen/python-mode'
    "func taglist
    Plugin 'taglist.vim'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
endif

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" show row number
set nu

" sudo save the file
command W w !sudo tee % > /dev/null

" redefine tab as 4 spaces(tabstop->effectively the width of an actual tab character)
set ts=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s

"insert spaces instead of tab characters
set expandtab
set wrap
set textwidth=0 wrapmargin=0
set tags=./tags;/
set ruler " make it show msg bottom
syntax on

" cscope part
set cscopetag
" cs add ./cscope.out

" make comments looks better
hi Comment ctermfg=6


" nerdtree
map <leader>t :NERDTreeToggle<CR>
" show lines
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" show the hidden file
let NERDTreeShowHidden=1
" set the window size
let NERDTreeWinSize=31
" share nerdtree before vim startup
let g:nerdtree_tabs_open_on_console_startup=1
" ignore file list
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" list bookmark list
let NERDTreeShowBookmarks=1
" if only open files in nerdtree then close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" vim power-line
set laststatus=2
let g:Powerline_symbols='unicode'
set t_Co=256

" taglist
map <silent> <leader>tl :TlistToggle<cr>

" auto match brackets, show the matching part of the pair for [] {} and ()
set showmatch
" show a visual line under the cursor's current line
set cursorline
" show the leader command
set showcmd

" syntax checking plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" nerdcommenter plugin
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"" CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip            " MacOSX/Linux
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


"" Supertab configuation
let g:SuperTabRetainCompletionType=2

"" Indent guide
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

""Python mode
let g:pymode_warnings = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_colorcolumn = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 10
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_folding = 0
let g:pymode_motion = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_virtualenv = 1
let g:pymode_run = 0
let g:pymode_run_bind = '<Leader>r'
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_lint_cwindow = 0
let g:pymode_lint_signs = 0
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'
let g:pymode_rope = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Tab>'
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
""C/C++ auto indent
autocmd FileType c,cpp set shiftwidth=4 | set expandtab
let g:syntastic_python_flake8_args='--ignore=E501,F401,H306,H404,H405,H301,H233'
""no hl search
nnoremap <leader><space> :nohlsearch<CR>
""tmux
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" split
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za
nnoremap <tab>o zR<CR>
nnoremap <tab>c zM<CR>

" ignore useless space
set encoding=utf-8

" auto complete
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_path_to_python_interpreter="/usr/bin/python3"

let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_server_use_stdout = 1

map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 1
let g:instant_markdown_mathjax = 1
let g:instant_markdown_open_to_the_world = 1

" background color scheme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" set system clipboard
" set clipboard=unnamed

"!!!!!!!!!!!!!!!!!!! list all map operation !!!!!!!!!!!!!!!!!!!!!!!!!

" support paste auto indent
set pastetoggle=<F2>
" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>
" background toggle
call togglebg#map("<F4>")
" cscope re-generate
map <F5> :!cscope -Rbq<CR>:cs reset<CR><CR>
" cscope cn
nmap <F6> :cn<cr>
" cscope cp
nmap <F7> :cp<cr>
" Tagbar congiruation
nmap <F8> :TagbarToggle<CR>
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" ctags
set tags+=/opt/src/**/tags
set tags+=/usr/include/tags
set tags+=/usr/include/sys/tags
set tags+=/usr/include/c++/4.8.5/tags

" auto indent
autocmd BufNewFile,BufRead *.{cpp,c,h} set equalprg=indent\ -gnu

" paste with indent
set paste

" allows cursor change in tmux mode
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

