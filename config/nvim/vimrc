set nocompatible               " be iMproved; required by Vundle

" ===========================================================================
"  Vundle config
" ===========================================================================
filetype off                   " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle; required
Plugin 'gmarik/Vundle.vim'

" General utility
Plugin 'L9'
Plugin 'textobj-user'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'rizzatti/funcoo.vim'

" UI enhancements
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'chriskempson/base16-vim'

" Specific utilities
Plugin 'kien/ctrlp.vim'
Plugin 'bufexplorer.zip'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/vim-easy-align'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-unimpaired'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-dispatch'
Plugin 'rhysd/clever-f.vim'

" General Programming/Markup language helpers
Plugin 'scrooloose/syntastic'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim.git'

" Specific Programming/Markup language helpers
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rbenv'
Plugin 'textobj-rubyblock'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-bundler'

" Below are plugins I'm not sure I use/want/need
" Plugin 'ack.vim'
" Plugin 'scroolose/nerdtree'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'bling/vim-airline'
" Plugin 'SuperTab'
" Plugin 'panozzaj/vim-autocorrect'
" Plugin 'sophacles/vim-bundle-sparkup'
" Plugin 'greyblake/vim-preview'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
" Plugin 'YankRing.vim'
" Plugin 'rizzatti/dash.vim'
" Plugin 'taglist.vim'
" Plugin 'rhysd/clever-f.vim'

" API wrappers
" Plugin 'mattn/gist-vim'
" - gist-vim requirement:
" Plugin 'mattn/webapi-vim'

" Can be helpful when picking colors:
" Plugin 'guns/xterm-color-table.vim'

" All Plugins must be added before the following line
call vundle#end()          " required
filetype plugin indent on  " required


" ===========================================================================
"  General config
" ===========================================================================
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
"  Custom key mappings
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
" set showmode                  " indicate current mode
set hidden                    " keep buffers loaded but hidden when abondoned
set wildmenu                  " expanded completion on cmdline
set wildmode=list:longest     "  - options
set visualbell                " no beeping

set cursorline                " highlight the Cursor Line (current line)
set cursorcolumn              " ... same, but Column

set ttyfast
set ruler
set laststatus=2              " Always show the statusline in all windows
set noshowmode       " Hide default mode text (e.g. --INSERT-- below statusline)
set number
set undofile

set previewheight=24
set splitbelow splitright

set linebreak
set textwidth=80
set formatoptions=n


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
"  Color scheme
" ---------------------------------------------------------------------------
set t_Co=256
set background=dark " light is default
let base16colorspace=256
colorscheme base16-railscasts

" Cursor row/column colors:
hi CursorLine guibg=#262626, ctermbg=235
hi CursorColumn guibg=#262626, ctermbg=235

" check to make sure vim has been compiled with colorcolumn
if exists("+colorcolumn")
  set colorcolumn=+1,+2,+3,+4,+5,+6
  " execute "set colorcolumn=" . join(map(range(2,259), '"+" . v:val'), ',')
endif


" ---------------------------------------------------------------------------
" Searching
" ---------------------------------------------------------------------------
set hlsearch                   " highlight matches
set incsearch                  " incremental searching
set ignorecase                 " searches are case insensitive ...
set smartcase                  " ... unless they contain >= 1 capital letter

" -----[ Highlight matches when jumping to next ]-------------
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

" -----[ Greping ] ------------------------------------------
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif


" ---------------------------------------------------------------------------
"  Directories
" ---------------------------------------------------------------------------
set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp


" ---------------------------------------------------------------------------
"  Mappings
" ---------------------------------------------------------------------------
set showmatch

" Ignore some binary, versioning and backup files when auto-completing
" set wildignore=.svn,CVS,*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak

" Set a lower priority for .old files
set suffixes+=.old


" ===========================================================================
"  Config for plugins
" ===========================================================================
" ---------------------------------------------------------------------------
" Ag
" ---------------------------------------------------------------------------
" bind \ (back slash) to grep shortcut  <-- Already exists; unnecessary
" command -nargs=+ -complete=file -bar AG silent! grep! <args>|cwindow|redraw!


" ---------------------------------------------------------------------------
" AutoClose
" ---------------------------------------------------------------------------
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]


" ---------------------------------------------------------------------------
" BufExplorer
" ---------------------------------------------------------------------------
let g:bufExplorerShowRelativePath = 1  " Show relative paths
let g:bufExplorerSplitRight = 0        " Split left


" ---------------------------------------------------------------------------
"  CoffeeScript
" ---------------------------------------------------------------------------
let coffee_compile_vert = 1
" augroup ErrinsCoffeeScriptAuGroup
"   autocmd!
"   autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
" augroup END


" ---------------------------------------------------------------------------
" CtrlP
" ---------------------------------------------------------------------------
" let g:ctrlp_user_command = 'find %s -type f'  " Default: use OS `find' command
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" ag is fast enough that CtrlP doesn't need to cache! <-- True?
" let g:ctrlp_use_caching = 0

" let g:ctrlp_open_new_file = 'v'  " Default: open new file in a vertical split
let g:ctrlp_open_new_file = 'r'  " open new file in the current window

" let g:ctrlp_open_multiple_files = 'v'  " Default: open each in a vert. split
let g:ctrlp_open_multiple_files = '1vr'


" ---------------------------------------------------------------------------
"  Fugitive
" ---------------------------------------------------------------------------
augroup ErrinsFugitiveCommit
  autocmd FileType gitcommit setlocal textwidth=72
augroup END

" ---------------------------------------------------------------------------
"  GitGutter
" ---------------------------------------------------------------------------
" GitGutter is on/off by default
" let g:gitgutter_enabled = 0           " Default: 1 (on)

" Stop GitGutter running in realtime
" let g:gitgutter_realtime = 0          " Default: 1 (on)

" Stop GitGutter running eagerly
" let g:gitgutter_eager = 0             " Default: 1 (on)

" Pass extra args to `git-diff'
let g:gitgutter_diff_args = '-w'        " Ignore whitespace

" Show signs by default
" let g:gitgutter_signs = 0             " Default: 1 (on)

" Always show the sign column
let g:gitgutter_sign_column_always = 1  " Default: 0 (off)

" Turn on line highlighting by default
" let g:gitgutter_highlight_lines = 1   " Default: 0 (off)

" Highlight line colors - uses DiffAdd, DiffChange, and DiffDelete by default
hi GitGutterAddLine          ctermfg=NONE ctermbg=18
hi GitGutterChangeLine       ctermfg=NONE ctermbg=18
hi GitGutterDeleteLine       ctermfg=NONE ctermbg=18
hi GitGutterChangeDeleteLine ctermfg=NONE ctermbg=18


" ---------------------------------------------------------------------------
"  Ruby/Rails
" ---------------------------------------------------------------------------
" Other files to consider Ruby
augroup ErrinsOtherRubyFilesAuGroup
  autocmd!
  autocmd BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby
augroup END


" ---------------------------------------------------------------------------
"  SASS / SCSS
" ---------------------------------------------------------------------------
augroup ErrinsStylesheetsAuGroup
  autocmd!
  autocmd BufRead,BufNewFile *.scss set filetype=scss
  " autocmd BufNewFile,BufReadPost *.scss setl foldmethod=indent
  " autocmd BufNewFile,BufReadPost *.sass setl foldmethod=indent
augroup END


" ---------------------------------------------------------------------------
"  Syntastic
" ---------------------------------------------------------------------------
" Jump to first detected issue when saving/opening
" let g:syntastic_auto_jump=1      " Default: 0 (off)

" Automatically open/close the syntastic-error-window (location-list)
" let g:syntastic_auto_loc_list=1  " Default: 2 (error window closed wo/errors)


" ---------------------------------------------------------------------------
" TagBar
" ---------------------------------------------------------------------------
" open Tagbar on the left
let g:tagbar_left = 1

" auto-close Tagbar when tag selected
let g:tagbar_autoclose = 1

" sort tags by source-file order by default
let g:tagbar_sort = 0

" ---------------------------------------------------------------------------
"  Misc
" ---------------------------------------------------------------------------

" Finally, load custom configs
if filereadable(s:home_dir . '.vimrc.local')
  source ~/.vimrc.local
endif

" When vimrc, either directly or via symlink, is edited, automatically reload it
augroup ErrinsVimrcAuGroup
  autocmd!
  autocmd bufwritepost .vimrc,vimrc nested source %
augroup END

" ===========================================================================
" Config options for plugins not being used
" ===========================================================================
" ---------------------------------------------------------------------------
"  Gist
" ---------------------------------------------------------------------------
" let g:gist_post_private = 1                  " private gists by default
" let g:gist_open_browser_after_post = 1       " open browser after posting
" let g:gist_browser_command = 'open %URL% &'  " use `open` for Gist URLs
" let g:gist_get_multiplefile = 1              " open all files if more than one


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
"  Pipe2Eval
" ---------------------------------------------------------------------------
" let g:pipe2eval_map_key = '!'


" ---------------------------------------------------------------------------
" TagList
" ---------------------------------------------------------------------------
" set tags=./tags;
" set tags+=gems.tags
"
" " Ctags path (brew install ctags)
" let Tlist_Ctags_Cmd = 'ctags'
"
" let Tlist_Use_Right_Window = 1
" let Tlist_WinWidth = 60
"
" " Use only current file to autocomplete from tags
" " set complete=.,t
" set complete=.,w,b,u,t,i


" ---------------------------------------------------------------------------
" Clever-F
" ---------------------------------------------------------------------------
" let g:clever_f_fix_key_direction = 1       " Always search forward/back with f/F
" let g:clever_f_chars_match_any_signs = ';' " match any/all signs with f;


