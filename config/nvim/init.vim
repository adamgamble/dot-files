" Nvim makes many of my previous settings enabled by default. I've commented
" those out and tagged them with '[Nvim]' to make that clear


" ===========================================================================
"  Plug.vim config
" ===========================================================================
call plug#begin('~/.local/share/nvim/plugged')

" Step one...
if !has('nvim')
  Plug 'tpope/vim-sensible'
endif

" General utility
Plug 'vim-scripts/L9'
Plug 'kana/vim-textobj-user'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'rizzatti/funcoo.vim'
Plug 'tpope/vim-dispatch'       " Hook into external test/compile/run stuff
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Specific utilities
Plug 'junegunn/fzf.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-vinegar'        " Enhancements for netrw: built-in Dir browser
Plug 'tpope/vim-repeat'         " repeat (supported) Plugins' commands
Plug 'tpope/vim-unimpaired'     " ...many things; always in pairs ;)
Plug 'tpope/vim-fugitive'       " Git
Plug 'airblade/vim-gitgutter'   " See 'signs' for Git-tracked changes
Plug 'timakro/vim-searchant'    " improved search highlighting
Plug 'junegunn/vim-easy-align'  " 🌻  A Vim alignment plugin
Plug 'junegunn/vim-peekaboo'    " 👀  \"/ @ / CTRL-R
" Plug 'bufexplorer.zip'
" Plug 'rking/ag.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'gerw/vim-HiLinkTrace'     " Show syntax/color hierarchies

" General Programming/Markup language helpers
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
" Plug 'scrooloose/syntastic'

" Specific Programming/Markup language helpers
Plug 'tpope/vim-rbenv'
Plug 'tpope/rbenv-ctags'
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-haml'
Plug 'thoughtbot/vim-rspec'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
" Plug 'file:///Users/errinlarsen/Code/github.com/errinlarsen/vim-curly'

" UI enhancements
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Add plugins to &runtimepath
call plug#end()

" load vim-sensible NOW; allows below to override vim-sensible
runtime! plugin/sensible.vim

" nelstrom/vim-textobj-rubyblock requires that the matchit.vim plugin is enabled
runtime macros/matchit.vim

" ===========================================================================
"  General config
" ===========================================================================
" syntax enable                  " [Nvim]
" filetype plugin indent on      " load file type plugins + indentation [Nvim]

" set modelines=0                " don't check top and bottom limes for settings
" set clipboard=unnamed       " unnamedplus (maybe? for nvim?)

set ttimeoutlen=-1            " set to default; overrides vim-sensible plugin


" ---------------------------------------------------------------------------
" Whitespace
" ---------------------------------------------------------------------------
set nowrap                     " don't wrap lines by default
set tabstop=2 shiftwidth=2     " a tab is two spaces
set softtabstop=2              " do I need this?
set expandtab                  " use spaces, not <tab>s


" ---------------------------------------------------------------------------
"  Custom key mappings
" ---------------------------------------------------------------------------
let s:home_dir = expand("$HOME/")

" Load key-mappings
if filereadable(s:home_dir . ".config/nvim/keymappings.vim")
  source ~/.config/nvim/keymappings.vim
endif


" ---------------------------------------------------------------------------
"  UI
" ---------------------------------------------------------------------------
set title                      " Set title of the window

" NOTE: vim-sensible sets scrolloff=1 by default...
set scrolloff=2                " Keep 2 lines at top/bottom when scrolling
set sidescroll=2
set showbreak=↪>\

set hidden                     " keep buffers loaded but hidden when abondoned
set wildmode=list:longest      "  - options
set visualbell                 " no beeping

set cursorline                 " highlight the Cursor Line (current line)
" set cursorcolumn               " ... same, but Column

" set laststatus=2               " Always show statusline in all windows [Nvim]
set noshowmode       " Hide default mode text (e.g. --INSERT-- below statusline)
set number

set previewheight=24
set splitbelow splitright

set linebreak
set textwidth=80
set formatoptions+=n
set listchars=tab:≫∙,trail:∘,extends:⇰,precedes:∙


" ---------------------------------------------------------------------------
"  Color scheme
" ---------------------------------------------------------------------------
set t_Co=256
set background=dark            " light is default

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Customized highlight groups
hi Error        guifg=#b6b3eb guibg=#da4939 ctermfg=05 ctermbg=01
hi qfLineNr     guifg=#b6b3eb guibg=#272935 ctermfg=05 ctermbg=18
hi QuickFixLine               guibg=#272935            ctermbg=08
hi! link SearchCurrent Error

" check to make sure vim has been compiled with colorcolumn
if exists("+colorcolumn")
  set colorcolumn=+1,+2,+3,+4,+5,+6
endif

" Trying some custom comment-only keyword highlighting:
" syn keyword rubyTodo	  FIXME NOTE TODO OPTIMIZE XXX todo contained
autocmd Syntax * syntax keyword Todo ERRIN NOTES containedin=.*Comment.* contained


" ---------------------------------------------------------------------------
" Searching
" ---------------------------------------------------------------------------
" set hlsearch                   " highlight matches [Nvim]
set ignorecase                 " searches are case insensitive ...
set smartcase                  " ... unless they contain >= 1 capital letter


" -----[ Greping ] ------------------------------------------
" use rg over grep
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif


" ---------------------------------------------------------------------------
"  Files/Directories
" ---------------------------------------------------------------------------
" swap files:
" set noswapfile                                          " don't use a swapfile
" set dir=~/.local/share/nvim/swap         " default: $XDG_DATA_HOME/nvim/swap//
                                        " swap files (.swp) in a common location
                                         " - `//` means use the file's full path

" backup files:
" - The following is cut-n-pasted from `:help backup-table`...
"   'backup' 'writebackup'	action
"      off	     off	      no backup made
"      off	     on		      backup current file, deleted afterwards (default)
"      on	       off	      delete old backup, backup current file
"      on	       on		      delete old backup, backup current file

" set writebackup           " backup files (~) are made while writing (default),
" set nobackup                              " then deleted afterwards (default),
" set backupdir=.,$XDG_DATA_HOME/nvim/backup " default: .,$XDG_DATA_HOME/nvim/backup
" set backupdir=~/.local/share/nvim/backup/,~/tmp,.         " in a common location

" undo files:
" set undodir=~/.local/share/nvim/undo       " default: $XDG_DATA_HOME/nvim/undo

" ALL of the above are: [Nvim]

set undofile                                 " turn on undo files, and put them


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
" command! -nargs=+ -complete=file -bar AG silent! grep! <args>|cwindow|redraw!


" ---------------------------------------------------------------------------
" Ale (linter)
" ---------------------------------------------------------------------------
" Show errors or warnings in statusline - Set this. Airline will handle the rest
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 'on_save'

augroup Errin_qf_toc
  autocmd FileType qf setlocal textwidth=0
augroup END

" ---------------------------------------------------------------------------
" vim-Airline
" ---------------------------------------------------------------------------
if !has("gui_vimr")                            " if NOT in VimR GUI...
  let g:airline_theme='base16color'            " ...then use 'base16color' theme
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'error', 'warning' ]
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
"  CoffeeScript
" ---------------------------------------------------------------------------
let coffee_compile_vert = 1
" augroup ErrinsCoffeeScriptAuGroup
"   autocmd!
"   autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
" augroup END


" ---------------------------------------------------------------------------
" delimitMate
" ---------------------------------------------------------------------------
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]


" ---------------------------------------------------------------------------
"  Fugitive
" ---------------------------------------------------------------------------
augroup vimrc
  autocmd FileType gitcommit setlocal textwidth=72
augroup END


" ---------------------------------------------------------------------------
"  fzf.vim
" ---------------------------------------------------------------------------
" give the same prefix to the fzf.vim commands; i.e. :Files => :FzfFiles
let g:fzf_command_prefix = 'Fzf'

" This is the default extra key bindings:
" let g:fzf_action = {'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit'}

" Default fzf layout
" - down / up / left / right
" let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
" let g:fzf_history_dir = '~/.fzf-history'

" RipGrep options for FzfRG command:
" --column          - Show column numbers (1 based; 1st match in line) in output.
    " ...this implies --line-number (Show line numbers; 1-based)
" --no-heading      -  Don't  group  matches  by each file.
" --color WHEN      - Whether to use color in the output.
    " ...when 'always', coloring is attempted based on environment
" -i, --ignore-case - Case insensitive search.
command! -bang -nargs=* FzfRg
  \  call fzf#vim#grep(
  \    'rg --column --no-heading --color=always -i '.shellescape(<q-args>), 1,
  \    <bang>0 ? fzf#vim#with_preview('up:60%')
  \            : fzf#vim#with_preview('right:50%:hidden', '?'),
  \    <bang>0)


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
set signcolumn=yes

" Turn on line highlighting by default
" let g:gitgutter_highlight_lines = 1   " Default: 0 (off)

" Highlight line colors - uses DiffAdd, DiffChange, and DiffDelete by default
hi GitGutterAddLine          ctermfg=NONE ctermbg=02
hi GitGutterChangeLine       ctermfg=NONE ctermbg=04
hi GitGutterDeleteLine       ctermfg=NONE ctermbg=08
hi GitGutterChangeDeleteLine ctermfg=NONE ctermbg=05


" ---------------------------------------------------------------------------
"  vim-Markdown
" ---------------------------------------------------------------------------
let g:markdown_fenced_languages = ['html', 'ruby', 'bash=sh']


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
augroup vimrc
  autocmd BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby
augroup END


" ---------------------------------------------------------------------------
"  SASS / SCSS
" ---------------------------------------------------------------------------
augroup vimrc
  autocmd BufRead,BufNewFile *.scss set filetype=scss
  " autocmd BufNewFile,BufReadPost *.scss setl foldmethod=indent
  " autocmd BufNewFile,BufReadPost *.sass setl foldmethod=indent
augroup END


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
" if filereadable(s:home_dir . '.config/nvim/init.vim.local')
"   source ~/.config/nvim/init.vim.local
" endif

" When vimrc, either directly or via symlink, is edited, automatically reload it
augroup vimrc
  autocmd bufwritepost .config/nvim/init.vim,vimrc nested source %
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
