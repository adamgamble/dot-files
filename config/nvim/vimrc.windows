set nocompatible               " be iMproved

" ---------------------------------------------------------------------------
"  Plugins
" ---------------------------------------------------------------------------
silent! runtime bundles.vim

" ---------------------------------------------------------------------------
"  General
" ---------------------------------------------------------------------------
syntax enable
set encoding=utf-8
set showcmd                    " display incomplete commands
filetype plugin indent on      " load file typ plugins + indentation

set modelines=0                " don't check top and bottom limes for settings
set history=1000               " Set how many cmd/search/input/etc. lines are saved
set nobackup                   " don't save a backup when writing
set nowritebackup
set noswapfile                 " don't use a swapfile
set autoread                   " read a file if it changes outside of Vim

set clipboard=unnamed

" ---------------------------------------------------------------------------
" Whitespace
" ---------------------------------------------------------------------------
set nowrap                     " don't wrap lines
set tabstop=2 shiftwidth=2     " a tab is two spaces
set softtabstop=2              " do I need this?
set expandtab                  " use spaces, not <tab>s
set backspace=indent,eol,start " backspace through everything in Insert mode
set autoindent                 " copy indent from curr line when starting next
" set smartindent                " start indents intelligently based on syntax

" ---------------------------------------------------------------------------
"  Key mappings
" ---------------------------------------------------------------------------
let s:home_dir = expand("$HOME/")

" Load key-mappings
if filereadable(s:home_dir . ".vim/keymappings.vim")
  source ~/.vim/keymappings.vim
endif

" ---------------------------------------------------------------------------
"  UI
" ---------------------------------------------------------------------------
set title                     " Set title of the window
set scrolloff=3               " Keep 3 lines at top/bottom when scrolling
set showmode                  " indicate current mode
set hidden                    " keep buffers loaded but hidden when abondoned
set wildmenu                  " expanded completion on cmdline
set wildmode=list:longest     "  - options
set visualbell                " no beeping

set cursorline                " highlight the Cursor Line (current line)
set cursorcolumn              " ... same, but Column

set ttyfast
set ruler
set laststatus=2
set number
set undofile

" Auto adjust window sizes when they become current
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

set splitbelow splitright

set textwidth=79
set formatoptions=n

" ---------------------------------------------------------------------------
"  Color scheme
" ---------------------------------------------------------------------------
set t_Co=256
set background=dark " light is default
let base16colorspace=256
colorscheme base16-railscasts

" Cursor row/column colors:
hi CursorLine ctermbg=235
hi CursorColumn ctermbg=235

" check to make sure vim has been compiled with colorcolumn support
" before enabling it
if exists("+colorcolumn")
  set colorcolumn=81
endif

" ---------------------------------------------------------------------------
" Searching
" ---------------------------------------------------------------------------
set hlsearch                   " highlight matches
set incsearch                  " incremental searching
set ignorecase                 " searches are case insensitive ...
set smartcase                  " ... unless they contain >= 1 capital letter

"=====[ Highlight matches when jumping to next ]=============
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.3)<cr>
nnoremap <silent> N   N:call HLNext(0.3)<cr>

" ... which just highlights the match in red
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('Error', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" ---------------------------------------------------------------------------
"  Mappings
" ---------------------------------------------------------------------------
set showmatch

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=.svn,CVS,.git,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak
" Set a lower priority for .old files
set suffixes+=.old


" ===========================================================================
"  Plugins
" ===========================================================================


" ---------------------------------------------------------------------------
" CtrlP
" ---------------------------------------------------------------------------
" let g:ctrlp_open_new_file = 'v'  " Default: open new file in a vertical split
let g:ctrlp_open_new_file = 'r'  " open new file in the current window

" let g:ctrlp_open_multiple_files = 'v'  " Default: open each in a vert. split
let g:ctrlp_open_multiple_files = '1vr'

" ---------------------------------------------------------------------------
" NERDTree
" ---------------------------------------------------------------------------
" let NERDTreeShowBookmarks = 0
" let NERDChristmasTree = 1
" let NERDTreeWinPos = "left"
" let NERDTreeHijackNetrw = 1
" let NERDTreeQuitOnOpen = 1
" let NERDTreeWinSize = 50
" let NERDTreeChDirMode = 2
" let NERDTreeDirArrows = 1
"
" " Open NERDTree if Vim was started with no files listed on the cmd line
" autocmd vimenter * if !argc() | NERDTree | endif

" ---------------------------------------------------------------------------
" BufExplorer
" ---------------------------------------------------------------------------
let g:bufExplorerShowRelativePath = 1  " Show relative paths
let g:bufExplorerSplitRight = 0        " Split left

" ---------------------------------------------------------------------------
" TagList
" ---------------------------------------------------------------------------
set tags=./tags;
set tags+=gems.tags
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60
" Use only current file to autocomplete from tags
" set complete=.,t
set complete=.,w,b,u,t,i

" ---------------------------------------------------------------------------
" AutoClose
" ---------------------------------------------------------------------------
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" ---------------------------------------------------------------------------
"  Syntastic
" ---------------------------------------------------------------------------
" let g:syntastic_auto_loc_list=1
" let g:syntastic_auto_jump=1

" ---------------------------------------------------------------------------
"  Ruby/Rails
" ---------------------------------------------------------------------------
" Other files to consider Ruby
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

" ---------------------------------------------------------------------------
"  CoffeeScript
" ---------------------------------------------------------------------------
let coffee_compile_vert = 1
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" ---------------------------------------------------------------------------
"  SASS / SCSS
" ---------------------------------------------------------------------------
au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

" ---------------------------------------------------------------------------
" GUI
" ---------------------------------------------------------------------------
if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA
  set mouse=v
  set guifont=Sauce\ Code\ Powerline\ Semibold:h13 "<- Maybe a good idea when using mac
endif

" ---------------------------------------------------------------------------
"  Directories
" ---------------------------------------------------------------------------
set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" ---------------------------------------------------------------------------
"  Gist
" ---------------------------------------------------------------------------
let g:gist_post_private = 1                  " private gists by default
let g:gist_open_browser_after_post = 1       " open browser after posting
let g:gist_browser_command = 'open %URL% &'  " use `open` for Gist URLs
let g:gist_get_multiplefile = 1              " open all files if more than one


" ---------------------------------------------------------------------------
"  Pipe2Eval
" ---------------------------------------------------------------------------
let g:pipe2eval_map_key = '!'


" ---------------------------------------------------------------------------
"  Misc
" ---------------------------------------------------------------------------

" Finally, load custom configs
if filereadable(s:home_dir . '.vimrc.local')
  source ~/.vimrc.local
endif

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Left over from un-used plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ---------------------------------------------------------------------------
"  vim-airline
" ---------------------------------------------------------------------------
" " Enable Powerline fonts
" let g:airline_powerline_fonts = 1
" " Change truncation widths
" let g:airline#extensions#default#section_truncate_width
"       \= {'b': 104, 'x': 60, 'y': 104, 'z': 45}


" ---------------------------------------------------------------------------
"  MultipleCursor  " Not yet ready for prime-time
" ---------------------------------------------------------------------------
" let g:multi_cursor_use_default_mapping = 0  " Toggle Default mappings
" let g:multi_cursor_start_key = '<C-m>'
" let g:multi_cursor_start_key = '<C-n>       " - Default
" let g:multi_cursor_next_key='<C-n>'         " - Default
" let g:multi_cursor_prev_key='<C-p>'         " - Default
" let g:multi_cursor_skip_key='<C-x>'         " - Default
" let g:multi_cursor_quit_key='<Esc>'         " - Default


" ---------------------------------------------------------------------------
"  GitGutter  " Not using currently
" ---------------------------------------------------------------------------
" let g:gitgutter_enabled = 0       " Turned off by default
" let g:gitgutter_diff_args = '-w'  " Ignore whitespace
"
" " Highlight line colors:
" hi GitGutterAddLine    ctermfg=NONE ctermbg=238
" hi GitGutterChangeLine ctermfg=NONE ctermbg=238
" hi GitGutterDeleteLine ctermfg=NONE ctermbg=238
