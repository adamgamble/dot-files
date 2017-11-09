" ===========================================================================
"  Mappings
" ===========================================================================
let mapleader   = ","
let g:mapleader = ","

" " Map Quit
" nmap    <Leader><Esc>     :q!<CR>
" Map ESC
imap      jj                <ESC>
" When on the cmdline - '%%' expands to this buffer's path, relative to CWD
cnoremap  %%                <C-R>=expand('%:h').'/'<cr>


" ---------------------------------------------------------------------------
"  Movement
" ---------------------------------------------------------------------------
nnoremap  <Left>            :echoe "Use h"<CR>
nnoremap  <Right>           :echoe "Use l"<CR>
nnoremap  <Up>              :echoe "Use k"<CR>
nnoremap  <Down>            :echoe "Use j"<CR>

" Change up/down (j/k are linewise; gj/gk allows up/down within wrapped line)
nnoremap  j                 gj
nnoremap  k                 gk

" Turn off arrow keys
" - http://yehudakatz.com/2010/07/29/ \
"     everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
inoremap  <up>              <nop>
inoremap  <down>            <nop>
inoremap  <left>            <nop>
inoremap  <right>           <nop>

" Move between splits
" if has('nvim')  " ...because, nvim respects terminfo, but vim doesn't
"   nnoremap <BS> <C-w>h
" else
"   nnoremap <C-h> <C-w>h
" endif

nnoremap  <C-h>             <C-w>h
nnoremap  <C-j>             <C-w>j
nnoremap  <C-k>             <C-w>k
nnoremap  <C-l>             <C-w>l


" Scrolling (because: CTRL keys Sux0rs && RSI)
" nnoremap  <C-e>             <C-e> " Scroll screen down one line
" nnoremap  <C-y>             <C-y> " Scroll screen up one line
" nnoremap  <C-d>             <C-d> " Scroll down half a window
" nnoremap  <C-u>             <C-u> " Scroll up half a window
" nnoremap  <C-f>             <C-f> " Scroll down a full page
" nnoremap  <C-b>             <C-b> " Scroll up a full page

" Move between tabs
" nnoremap  <Bslash>          gt
" nnoremap  <Bar>             gT

" Center screen when scrolling search results
nmap      n                 nzz
nmap      N                 Nzz


" ---------------------------------------------------------------------------
"  Splits/Tabs
" ---------------------------------------------------------------------------
" Cycle through buffers
noremap   <tab>             :bn<cr>
noremap   <S-tab>           :bp<cr>

" Switch between last two buffers
nnoremap  <Leader><Leader>  <c-^>

" Close buffer
noremap   <Leader>bd        :bd<cr>

" " Close all buffers
" nmap    <Leader>da        :bufdo bd<CR>

" Unload buffer
noremap   <Leader>bu        :bun<cr>

" Wipeout buffer
noremap   <Leader>bw        :bw<cr>

" Window commands
nnoremap  <Leader>w         <C-w>

" Create new tab
map       <Esc>t            :tabnew<cr>
map       <Esc>T            :tabedit %%


" ---------------------------------------------------------------------------
"  Files
" ---------------------------------------------------------------------------
" Edit/View files relative to current directory
" map       <Leader>e         :edit %%
" map       <Leader>v         :view %%

" " open file browser
" noremap   <Leader>e         :NERDTreeToggle<cr>

" " find current file in file browser
" noremap   <C-p>             :NERDTreeFind<cr>

" FZF...
" <C-p> or <C-t> to search files
" nnoremap <silent> <C-t> :FZF -m<cr>
" nnoremap <silent> <C-p> :FZF -m<cr>

" fzf - Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
nmap    <c-x><tab> <plug>(fzf-maps-i)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" fzf - Insert mode completion
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-d> <plug>(fzf-complete-path)
imap <c-x><c-g> <plug>(fzf-complete-file-ag)
imap <c-x><c-b> <plug>(fzf-complete-line)


" fzf - Advanced customization using autoload functions
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" fzf - personalized mappings
" ---------------------------------------------------------------------------
" Files [PATH]    | Files (similar to  `:FZF` )
noremap <Leader>ff          :FzfFiles<cr>
noremap <Leader>FF          :FzfFiles

" GFiles [OPTS]   | Git files (git ls-files)
noremap <Leader>fg          :FzfGFiles<cr>
noremap <Leader>FG          :FzfGFiles

" GFiles?         | Git files (git status)
" Buffers         | Open buffers
noremap <Leader>fb          :FzfBuffers<cr>
noremap <Leader>FB          :FzfBuffers

" Colors          | Color schemes
" Ag [PATTERN]    | {ag}{5} search result (ALT-A to select all, ALT-D to deselect all)
" RG [PATTERN]    | {rg}{5} search result
noremap <Leader>fr          :FzfRg<cr>
noremap <Leader>FR          :FzfRg

" Lines [QUERY]   | Lines in loaded buffers
noremap <Leader>fl          :FzfLines<cr>
noremap <Leader>FL          :FzfLines

" BLines [QUERY]  | Lines in the current buffer

" Tags [QUERY]    | Tags in the project ( `ctags -R` )
noremap <Leader>ft          :FzfTags<cr>
noremap <Leader>FT          :FzfTags

" BTags [QUERY]   | Tags in the current buffer
" Marks           | Marks
" Windows         | Windows
" Locate PATTERN  |  `locate`  command output
" History         |  `v:oldfiles`  and open buffers
" History:        | Command history
" History/        | Search history
" Snippets        | Snippets ({UltiSnips}{6})

" Commits         | Git commits (requires {fugitive.vim}{7})
noremap <Leader>fc          :FzfCommits<cr>
noremap <Leader>FC          :FzfCommits

" BCommits        | Git commits for the current buffer
" Commands        | Commands
" Maps            | Normal mode mappings
noremap <Leader>fm          :FzfMaps<cr>
noremap <Leader>FM          :FzfMaps

" Helptags        | Help tags [1]
noremap <Leader>fh          :FzfHelptags<cr>
noremap <Leader>FH          :FzfHelptags

" Filetypes       | File types


" ---------------------------------------------------------------------------
" Ruby...
" ---------------------------------------------------------------------------
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" ---------------------------------------------------------------------------
" RAILS...
" ---------------------------------------------------------------------------
" View routes or Gemfile in large split
map       <Leader>gr        :topleft :split config/routes.rb<cr>
map       <Leader>gg        :topleft 100 :split Gemfile<cr>

" Skip to Model, View or Controller
map       <Leader>m         :Rmodel
map       <Leader>v         :Rview
map       <Leader>c         :Rcontroller

" " Saving
" nmap    <Leader>w         :w!<CR>
" nmap    <Leader>q         :wqa!<CR>


" ---------------------------------------------------------------------------
"  Syntax stuff
" ---------------------------------------------------------------------------
" indent file and return cursor and center cursor
map       <silent> <F6>     mmgg=G'mzz
imap      <silent> <F6>     <Esc> mmgg=G'mzz

" Auto format
map       ===               mmgg=G`m^zz


" ---------------------------------------------------------------------------
" vim-easy-align:
" ---------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Easy commenting - TComment
" nnoremap  //                :TComment<CR>
" vnoremap  //                :TComment<CR>

" " Generate ctags for all bundled gems as well
" map     <Leader>rt        :!ctags --extra=+f --languages=-javascript
"                           \ --exclude=.git --exclude=log -R *
"                           \ `rvm gemdir`/gems/*
"                           \ `rvm gemdir`/bundler/gems/*<CR><C-M>


" ---------------------------------------------------------------------------
"  Searches
" ---------------------------------------------------------------------------
" " search (forwards)
" nmap <space> /
" " search (backwards)
" map <c-space> ?

" Search using :Ag (i.e. The Silver Searcher)
" nnoremap <Leader>ag         :Ag<SPACE>

" Remove trailing whitespace
nnoremap  <Leader>tw         :%s/\s\+$//e<CR>:let @/=''<CR>

" Highlight Merge-conflicts
nnoremap  <Leader>mc        /<<<<<\\|=====\\|>>>>><CR>

" ---------------------------------------------------------------------------
"  vim.wikia.com/wiki/Short_mappings_for_common_tasks
" ---------------------------------------------------------------------------
" Keep the current visual block selection active after changing indent
vmap > >gv
vmap < <gv

" Record into register 'q', playback with 'Q'
nnoremap Q @q

" Disable 'q:' - I never use it and I always get annoyed when I hit it
map q: <nop>


" ---------------------------------------------------------------------------
"  Misc.
" ---------------------------------------------------------------------------
" Execute current buffer as ruby
noremap   <Leader>rb        :w !ruby<CR>

" Toggle GitGutter
" noremap   <C-g><C-g>        :GitGutterToggle<CR> <Bar> :GitGutterLineHighlightsToggle<CR>
noremap   <C-g><C-g>        :GitGutterLineHighlightsToggle<CR>

" Toggle Gundo
" nnoremap <Leader>gu :GundoToggle<CR>

" Toggle Tagbar
" nnoremap <Leader>tb :TagbarToggle<CR>


" ---------------------------------------------------------------------------
"  Left-overs
" ---------------------------------------------------------------------------
" " Move lines up and down
" map <C-J> :m +1 <CR>
" map <C-K> :m -2 <CR>

" " F2 - Terminal
" map <F2> :ConqueTerm zsh<CR>

" " F3 - YankRing
" nnoremap <silent> <F3> :YRShow<cr>
" inoremap <silent> <F3> <ESC>:YRShow<cr>

" vim: set tw=78 et ft=vim:
