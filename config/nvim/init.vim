" Nvim makes many of my previous settings enabled by default. I've commented
" those out and tagged them with '[Nvim]' to make that clear

" ===========================================================================
"  Plug.vim config
" ===========================================================================
call plug#begin('~/.local/share/nvim/plugged')

" General utility
Plug '/usr/local/opt/fzf'       " 'cause I installed fzf with homebrew
" Plug 'tpope/vim-dispatch'       " Hook into external test/compile/run stuff

" Specific utilities
Plug 'junegunn/fzf.vim'         " fzf ❤️  vim
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tpope/vim-unimpaired'     " ...many things; always in pairs ;)
Plug 'tpope/vim-repeat'         " repeat (supported) Plugins' commands
Plug 'junegunn/vim-peekaboo'    " 👀  \"/ @ / CTRL-R
Plug 'junegunn/vim-slash'       " Enhancing in-buffer search experience
Plug 'junegunn/vim-easy-align'  " 🌻  A Vim alignment plugin
Plug 'ntpeters/vim-better-whitespace' " Better whitespace highlighting for Vim
" Plug 'vimwiki/vimwiki'          " Personal Wiki - http://vimwiki.github.io/
" Plug 'gerw/vim-HiLinkTrace'     " Show syntax/color hierarchies

" Git + GitHub stuff
Plug 'tpope/vim-fugitive'       " a Git wrapper so awesome, it should be illegal
Plug 'mhinz/vim-signify'        " Signify diff in sign column
Plug 'junegunn/gv.vim'          " A git commit browser

" Browsing
" Plug 'tpope/vim-vinegar'        " Enhancements for netrw: built-in Dir browser
Plug 'scrooloose/nerdtree' , { 'on': ['NERDTreeToggle', 'NERDTreeToggleVCS', 'NERDTreeFind'] } " - tree explorer for vim
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' } " show indention lvls

" Lint
Plug 'dense-analysis/ale'       " Plug 'w0rp/ale'

" General Programming/Markup language helpers
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
" Plug 'tpope/vim-surround' " 👇 Trying out a different plugin
Plug 'machakann/vim-sandwich'

" Specific Programming/Markup language helpers
Plug 'tpope/vim-rbenv'
Plug 'tpope/rbenv-ctags'
Plug 'vim-ruby/vim-ruby'
Plug 'AndrewRadev/splitjoin.vim' " simplify transitions: multi/single line code
Plug 'tpope/vim-bundler', { 'for': 'ruby'  }
Plug 'tpope/vim-rails', { 'for': [] }
Plug 'tpope/vim-rake'
Plug 'tpope/vim-markdown'
Plug 'junegunn/vim-emoji'       " 😃 Emoji in Vim
" Plug 'tpope/vim-haml'           " Not using right now!
" Plug 'kchmck/vim-coffee-script' " Not using right now!
" Plug 'slim-template/vim-slim'   " Not using right now!

" UI enhancements
Plug 'vim-airline/vim-airline'  " status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'  " A collection of themes for vim-airline
Plug 'chriskempson/base16-vim'  " Base16 for Vim
Plug 'morhetz/gruvbox'          " Retro groove color scheme for Vim
Plug 'ryanoasis/vim-devicons'   " Adds file type icons to Vim plugins


" ... other Colors (found in junegunn's .vimrc)
" Plug 'tomasr/molokai'
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'yuttie/hydrangea-vim'
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'AlessandroYorba/Despacio'
" Plug 'cocopon/iceberg.vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'nightsense/snow'
" Plug 'nightsense/stellarized'
" Plug 'arcticicestudio/nord-vim'

" ...other/previous/tried-em colorschemes
" Plug 'YorickPeterse/happy_hacking.vim'
" Plug 'rakr/vim-two-firewatch'
" Plug 'jacoborus/tender.vim'
" Plug 'roosta/srcery'

" Add plugins to &runtimepath
call plug#end()


" ===========================================================================
"  General config
" ===========================================================================
" syntax enable                  " [Nvim]
" filetype plugin indent on      " load file type plugins + indentation [Nvim]

" set modelines=0                " don't check top and bottom limes for settings
" set clipboard=unnamed          " unnamedplus (maybe? for nvim?)

set ttimeoutlen=-1             " set to default; overrides vim-sensible plugin


" ---------------------------------------------------------------------------
"  Whitespace
" ---------------------------------------------------------------------------
set nowrap                     " don't wrap lines by default
set tabstop=2 shiftwidth=2     " a tab is two spaces
set softtabstop=2              " do I need this?
set expandtab                  " use spaces, not <tab>s



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

" set foldlevelstart=99

" ---------------------------------------------------------------------------
"  netrw
" ---------------------------------------------------------------------------
" let g:netrw_banner = 1
" let g:netrw_altfile = 1

" The following is thanks to BlakeWilliams
" let g:netrw_fastbrowse = 0
"   - discovered here: https://github.com/tpope/vim-vinegar/issues/13#issuecomment-489440040


" ---------------------------------------------------------------------------
"  Colorscheme Toggles/Variables
" ---------------------------------------------------------------------------
"
" GruvBox config
" ---------------
" let g:gruvbox_bold = 0                   " default: 1      Enables bold text
let g:gruvbox_italic = 1                 " default: 0      Enables italic text (gui default: 1)
" let g:gruvbox_underline = 0              " default: 1      Enables underlined text
" let g:gruvbox_undercurl = 0              " default: 1      Enables undercurled text
" let g:gruvbox_italicize_comments = 0     " default: 1      Enables italic for comments
let g:gruvbox_italicize_strings = 1      " default: 0      Enables italic for strings
" let g:gruvbox_invert_selection = 0       " default: 1      Inverts selected text
" let g:gruvbox_invert_signs = 1           " default: 0      Inverts GitGutter/Syntastic signs
" let g:gruvbox_invert_indent_guides = 1   " default: 0      Inverts indent guides
" let g:gruvbox_invert_tabline = 1         " default: 0      Inverts tabline highlights
" let g:gruvbox_improved_strings = 1       " default: 0      Extrahighlighted strings
" let g:gruvbox_improved_warnings = 1      " default: 0      Extrahighlighted warnings
" let g:gruvbox_termcolors = 256           " default: 256    Refer https://github.com/morhetz/gruvbox/issues/4 for details
" let g:gruvbox_contrast_dark = 'hard'     " default: medium Changes dark mode contrast. Possible values are soft, medium and hard
" let g:gruvbox_contrast_light = 'soft'  " default: medium Changes light mode contrast. Possible values are soft, medium and hard

" For color-setting variables, possible values are any from the gruvbox palette.
" ------------------------------------------------------------------------------
" let g:gruvbox_hls_cursor = 'orange'      " default: orange Changes cursor background while search is highlighted
" let g:gruvbox_number_column = 'none'     " default: none   Changes number column background color
" let g:gruvbox_sign_column = 'bg1'        " default: bg1    Changes sign column background color
" let g:gruvbox_color_column = 'bg1'       " default: bg1    Changes color column background color
" let g:gruvbox_vert_split = 'bg0'         " default: bg0    Changes vertical split background color

" Functions
" ----------
" gruvbox#invert_signs_toggle()  " (...)
" gruvbox#hls_show()  " (...)
" gruvbox#hls_show_cursor() " (...)
" gruvbox#hls_hide()  " (...)
" gruvbox#hls_hide_cursor()  " (...)
" gruvbox#hls_toggle()  " (...)


" Srcry config
" -------------
" let g:srcery_bold = 1            " Enables bold text. default: 1
" let g:srcery_italic = 1          " Enables italic text. default: gui 1, term 0
" let g:srcery_underline = 1       " Enables underlined text. default: 1
" let g:srcery_undercurl = 1       " Enables undercurled text. default: 1
" let g:srcery_inverse = 1         " Enables inverse colors. default: 1

" TwoFirewatch config
" --------------
" let g:two_firewatch_italics=1

" Base16 config
" --------------
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

" Customized highlight groups
" hi Error        guifg=#b6b3eb guibg=#da4939 ctermfg=05 ctermbg=01
" hi qfLineNr     guifg=#b6b3eb guibg=#272935 ctermfg=05 ctermbg=18
" hi QuickFixLine               guibg=#272935            ctermbg=08
" hi! link SearchCurrent Error


" ---------------------------------------------------------------------------
"  Color scheme
" ---------------------------------------------------------------------------
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
set guifont=FiraCode-Medium:h12

" Colorscheme/Theme
" ------------------
" colorscheme gruvbox
colorscheme base16-gruvbox-dark-medium
" colorscheme happy_hacking
" colorscheme srcery
" colorscheme tender
" colorscheme two-firewatch

set background=dark            " light is default

" check to make sure vim has been compiled with colorcolumn
if exists("+colorcolumn")
  set colorcolumn=+1,+2,+3,+4,+5,+6
endif

" Trying some custom comment-only keyword highlighting:
" syn keyword rubyTodo	  FIXME NOTE TODO OPTIMIZE XXX todo contained
autocmd Syntax * syntax keyword Todo ERRIN NOTES containedin=.*Comment.* contained
autocmd Syntax * syntax keyword Todo TODO_TWILIO containedin=.*Comment.* contained
autocmd Syntax * syntax keyword Todo TODO-GRAPH containedin=.*Comment.* contained


" ---------------------------------------------------------------------------
"  Searching
" ---------------------------------------------------------------------------
" set hlsearch                   " highlight matches [Nvim]
set ignorecase                 " searches are case insensitive ...
set smartcase                  " ... unless they contain >= 1 capital letter


" -----[ Greping ] ------------------------------------------
" use rg over grep
if executable('rg')
  set grepprg=rg\ --vimgrep
  " set grepformat^=%f:%l:%c:%m
	set grepformat=%f:%l:%c:%m,%f:%l:%m  " found in junegunn's .vimrc
endif


" -----[ Diffing ] ------------------------------------------
" 'diffopt' 'dip'		string	(default "filler") -- global
" - filler		 Show filler lines, to keep the text synchronized with a window
"            that has inserted lines at the same position.  Mostly useful when
"            windows are side-by-side and 'scrollbind' is set.
" - vertical	 Start diff mode with vertical splits
"            (unless explicitly specified otherwise).
set diffopt=filler,vertical

" ---------------------------------------------------------------------------
"  Files/Directories
" ---------------------------------------------------------------------------
" swap files:
" set noswapfile                       " don't use a swapfile
" set dir=~/.local/share/nvim/swap     " default: $XDG_DATA_HOME/nvim/swap//
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
" set nobackup                         " then deleted afterwards (default),
" set backupdir=.,$XDG_DATA_HOME/nvim/backup " default: .,$XDG_DATA_HOME/nvim/backup
" set backupdir=~/.local/share/nvim/backup/,~/tmp,.

" undo files:
" set undodir=~/.local/share/nvim/undo " default: $XDG_DATA_HOME/nvim/undo

" ALL of the above are: [Nvim]

set undofile                           " turn on undo files

set tags^=./.git/tags


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
"
" ---------------------------------------------------------------------------
"  vim-Airline
" ---------------------------------------------------------------------------
let g:airline_theme = 'base16_gruvbox_dark_hard'
" let g:airline_theme = 'gruvbox'
" let g:airline_theme = 'tender'
" let g:airline_theme = 'twofirewatch'

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
"
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
"  Ale (linter)
" ---------------------------------------------------------------------------
" Show errors or warnings in statusline - Set this. Airline will handle the rest
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 'on_save'

" let g:ale_linters = {'ruby': ['ruby', 'rubocop']} " 'yaml': [],
" let g:ale_fixers = {'ruby': ['rubocop']}
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_lint_delay = 1000
" let g:ale_sign_warning = '──'
" let g:ale_sign_error = '══'

augroup Errin_qf_toc
  autocmd FileType qf setlocal textwidth=0
augroup END


" ---------------------------------------------------------------------------
"  vim-better-whitespace
" ---------------------------------------------------------------------------
let g:better_whitespace_enabled=1  " enable whitespace highlighting
let g:strip_whitespace_on_save=1   " enable stripping whitespace on save
let g:strip_whitespace_confirm=0   " disable confirmation on save
let g:strip_only_modified_lines=1  " only strip those lines _I_ modified


" ---------------------------------------------------------------------------
"  delimitMate
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


" ===========================================================================
" FZF stuff...
" ===========================================================================
if has('nvim') || has('gui_running')
	let $FZF_DEFAULT_OPTS .= ' --info=inline --layout=reverse'
endif


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
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': 'enew' }

" latest changes allow popup window
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.9 } }

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

" Hide statusline of terminal buffer
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler nonu
" 	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=? -complete=dir FzfFiles
	\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

""!   FzfTags     *                                  call fzf#vim#tags(<q-args>, <bang>0)
"command! -bang -nargs=? -complete=tag FzfTags
"  \ call fzf#vim#tags(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* -complete=buffer FzfBuffers
  \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview(), <bang>0)

function! s:plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! FzfPlugHelp call fzf#run(fzf#wrap({
  \ 'source': sort(keys(g:plugs)),
  \ 'sink':   function('s:plug_help_sink')}))

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let options = fzf#vim#with_preview(options)
  call fzf#vim#grep(initial_command, 1, options, a:fullscreen)
endfunction

command! -nargs=* -bang FzfRg call RipgrepFzf(<q-args>, <bang>0)


" ---------------------------------------------------------------------------
"  indentLine
" ---------------------------------------------------------------------------
autocmd! User indentLine doautocmd indentLine Syntax


" ---------------------------------------------------------------------------
"  vim-Markdown
" ---------------------------------------------------------------------------
let g:markdown_fenced_languages = ['html', 'ruby', 'bash=sh']


" ---------------------------------------------------------------------------
"  NERDTree
" ---------------------------------------------------------------------------
augroup nerd_loader
	autocmd!
	autocmd VimEnter * silent! autocmd! FileExplorer
	autocmd BufEnter,BufNew *
				\  if isdirectory(expand('<amatch>'))
				\|   call plug#load('nerdtree')
				\|   execute 'autocmd! nerd_loader'
				\| endif
augroup END
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
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" ----------------------------------------------------------------------------
"  Ruby/Rails
" ---------------------------------------------------------------------------
let g:ruby_indent_assignment_style = 'variable'

" Other files to consider Ruby
augroup vimrc
  autocmd BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby
augroup END


" ----------------------------------------------------------------------------
"  vim-ruby
" ----------------------------------------------------------------------------
" --- found in junegunn's .vimrc
" ft-ruby-syntax
let ruby_operators = 1
let ruby_space_errors = 1
" let ruby_fold = 1
" let ruby_no_expensive = 1
let ruby_spellcheck_strings = 1


" ---------------------------------------------------------------------------
"  SASS / SCSS
" ---------------------------------------------------------------------------
augroup vimrc
  autocmd BufRead,BufNewFile *.scss set filetype=scss
  " autocmd BufNewFile,BufReadPost *.scss setl foldmethod=indent
  " autocmd BufNewFile,BufReadPost *.sass setl foldmethod=indent
augroup END


" ----------------------------------------------------------------------------
"  vim-signify
" ----------------------------------------------------------------------------
let g:signify_vcs_list = ['git']
" let g:signify_skip_filetype = { 'journal': 1 }
" let g:signify_sign_add          = '│'
" let g:signify_sign_change       = '│'
" let g:signify_sign_changedelete = '│'


" ----------------------------------------------------------------------------
"  vim-slash
" ----------------------------------------------------------------------------
if has('timers')
	noremap <expr> <plug>(slash-after) slash#blink(3, 50)
endif


" ---------------------------------------------------------------------------
"  Misc
" ---------------------------------------------------------------------------
let s:home_dir = expand("$HOME/")

" load custom configs
if filereadable(s:home_dir . '.config/nvim/init.vim.local')
  source ~/.config/nvim/init.vim.local      " - currently, empty
endif

" Load key-mappings
if filereadable(s:home_dir . ".config/nvim/keymappings.vim")
  source ~/.config/nvim/keymappings.vim
endif
