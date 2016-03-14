set nocompatible               " be iMproved

" ===========================================================================
"  Plug.vim config
" ===========================================================================
call plug#begin('~/.nvim/plugged')

" Step one...
Plug 'tpope/vim-sensible'

" General utility
Plug 'L9'
Plug 'textobj-user'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'rizzatti/funcoo.vim'

" UI enhancements
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Specific utilities
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bufexplorer.zip'
Plug 'rking/ag.vim'
Plug 'tpope/vim-vinegar'        " Enhancements for netrw: built-in Dir browser
Plug 'tpope/vim-repeat'         " repeat (supported) Plugins' commands
Plug 'tpope/vim-unimpaired'     " ...many things; always in pairs ;)
Plug 'tpope/vim-fugitive'       " Git
Plug 'airblade/vim-gitgutter'   " See 'signs' for Git-tracked changes
Plug 'tpope/vim-dispatch'       " Hook into external test/compile/run stuff
" Plug 'gerw/vim-HiLinkTrace'     " Show syntax/color hierarchies

" General Programming/Markup language helpers
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'

" Specific Programming/Markup language helpers
Plug 'tpope/vim-rbenv'
Plug 'tpope/rbenv-ctags'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-haml'
Plug 'thoughtbot/vim-rspec'
Plug 'kchmck/vim-coffee-script'
" Plug 'slim-template/vim-slim'
" Plug 'file:///Users/errinlarsen/Code/github.com/errinlarsen/vim-curly'

" Add plugins to &runtimepath
call plug#end()

" load vim-sensible NOW; allows below to override vim-sensible
runtime! plugin/sensible.vim

" ===========================================================================
"  General config
" ===========================================================================
syntax enable
filetype plugin indent on      " load file type plugins + indentation

" set modelines=0                " don't check top and bottom limes for settings
set nobackup                   " don't save a backup when writing
set nowritebackup
" set noswapfile                 " don't use a swapfile

" set clipboard=unnamed       " unnamedplus (maybe? for nvim?)

set ttimeoutlen=-1            " set to default; overrides vim-sensible plugin

" ---------------------------------------------------------------------------
" Whitespace
" ---------------------------------------------------------------------------
set nowrap                     " don't wrap lines
set tabstop=2 shiftwidth=2     " a tab is two spaces
set softtabstop=2              " do I need this?
set expandtab                  " use spaces, not <tab>s


" ---------------------------------------------------------------------------
"  Custom key mappings
" ---------------------------------------------------------------------------
let s:home_dir = expand("$HOME/")

" Load key-mappings
if filereadable(s:home_dir . ".nvim/keymappings.vim")
  source ~/.nvim/keymappings.vim
endif


" ---------------------------------------------------------------------------
"  UI
" ---------------------------------------------------------------------------
set title                      " Set title of the window

" NOTE: vim-sensible sets scrolloff=1 by default...
set scrolloff=3                " Keep 3 lines at top/bottom when scrolling

set hidden                     " keep buffers loaded but hidden when abondoned
set wildmode=list:longest      "  - options
set visualbell                 " no beeping

set cursorline                 " highlight the Cursor Line (current line)
set cursorcolumn               " ... same, but Column

set ttyfast
set laststatus=2               " Always show the statusline in all windows
set noshowmode       " Hide default mode text (e.g. --INSERT-- below statusline)
set number
set undofile

set previewheight=24
set splitbelow splitright

set linebreak
set textwidth=80
set formatoptions+=n


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

" Trying some custom comment-only keyword highlighting:
" syn keyword rubyTodo	  FIXME NOTE TODO OPTIMIZE XXX todo contained
autocmd Syntax * syntax keyword Todo ERRIN NOTES containedin=.*Comment.* contained

" ---------------------------------------------------------------------------
" Searching
" ---------------------------------------------------------------------------
set hlsearch                   " highlight matches
set ignorecase                 " searches are case insensitive ...
set smartcase                  " ... unless they contain >= 1 capital letter

" -----[ Highlight matches when jumping to next ]-------------
" This rewires n and N to do the highlighing...
" nnoremap <silent> n   n:call HLNext(0.3)<cr>
" nnoremap <silent> N   N:call HLNext(0.3)<cr>

" " ... which just highlights the match in red
" " TODO: I think this is slow...
" function! HLNext (blinktime)
"   let [bufnum, lnum, col, off] = getpos('.')
"   let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
"   let target_pat = '\c\%#'.@/
"   let ring = matchadd('Error', target_pat, 101)
"   redraw
"   exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"   call matchdelete(ring)
"   redraw
" endfunction

" -----[ Greping ] ------------------------------------------
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore\ log
endif


" ---------------------------------------------------------------------------
"  Directories
" ---------------------------------------------------------------------------
set backupdir=~/tmp,/tmp
set undodir=~/.nvim/.tmp,~/tmp,~/.tmp,/tmp


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
" bind \ (back slash) to grep shortcut
command! -nargs=+ -complete=file -bar AG silent! grep! <args>|cwindow|redraw!


" ---------------------------------------------------------------------------
" vim-Airline
" ---------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'warning' ]
  \ ]
" let g:airline#extensions#default#section_truncate_width = {  " defaults
"   \ 'b': 79,
"   \ 'x': 60,
"   \ 'y': 88,
"   \ 'z': 45,
"   \ }
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 96,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 45,
    \ }
let g:airline#extensions#hunks#non_zero_only = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#tabline#fnamemod = ':~:.'
" let g:airline#extensions#tabline#fnamecollapse = 1
" let g:airline#extensions#tabline#fnametruncate = 0

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
" Exclude files and directories using Vim's wildignore...
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" ...and CtrlP's own g:ctrlp_custom_ignore:
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" ...the following is being ignored because `g:ctrlp_user_command` is set!
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Default: let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache!
" Default: let g:ctrlp_use_caching = 0

" Default: let g:ctrlp_open_new_file = 'v'
let g:ctrlp_open_new_file = 'r'  " in the current window

" Default: let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_open_multiple_files = '1vr'

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'undo', 'changes']


" ---------------------------------------------------------------------------
" delimitMate
" ---------------------------------------------------------------------------
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

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
"  RSpec.vim
" ---------------------------------------------------------------------------
" Custom Command: Use vim-dispatch
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

" Runner: I use iterm ...mostly
let g:rspec_runner = "os_x_iterm"



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
"  Vinegar
" ---------------------------------------------------------------------------
let g:netrw_altfile = 1
" let g:netrw_banner = 1

" ---------------------------------------------------------------------------
"  Misc
" ---------------------------------------------------------------------------

" Finally, load custom configs
" - currently, ExtraWhitespace stuff
if filereadable(s:home_dir . '.nvimrc.local')
  source ~/.nvimrc.local
endif

" When vimrc, either directly or via symlink, is edited, automatically reload it
augroup ErrinsVimrcAuGroup
  autocmd!
  autocmd bufwritepost .nvimrc,vimrc nested source %
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
" TagBar
" ---------------------------------------------------------------------------
" open Tagbar on the left
" let g:tagbar_left = 1

" auto-close Tagbar when tag selected
" let g:tagbar_autoclose = 1

" sort tags by source-file order by default
" let g:tagbar_sort = 0


" ---------------------------------------------------------------------------
" TagList
" ---------------------------------------------------------------------------
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
