set nocompatible               " be iMproved
bama_a.png

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/

call vundle#rc()

" General utility
Bundle "gmarik/vundle"
Bundle "L9"
Bundle "textobj-user"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "rizzatti/funcoo.vim"

" UI enhancements
Bundle "Lokaltog/powerline", {"rtp": "powerline/bindings/vim/"}
Bundle "chriskempson/base16-vim"

" Specific utilities
Bundle "kien/ctrlp.vim"
Bundle "bufexplorer.zip"
Bundle "ack.vim"
Bundle "rking/ag.vim"
Bundle "rizzatti/dash.vim"
Bundle "sjl/gundo.vim"
Bundle "tpope/vim-fugitive"
Bundle "junegunn/vim-easy-align"

" General Programming/Markup language helpers
Bundle "taglist.vim"
Bundle "scrooloose/syntastic"
Bundle "Townk/vim-autoclose"
Bundle "tpope/vim-surround"
Bundle "tomtom/tcomment_vim.git"

" Specific Programming/Markup language helpers
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rbenv"
Bundle "textobj-rubyblock"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-rails"
Bundle "skalnik/vim-vroom"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-haml"
Bundle "slim-template/vim-slim"
Bundle "tpope/vim-bundler"

" API wrappers
"  gist-vim requirement:
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"

" Below are plugins I'm not sure I use/want/need
" Bundle "scrooloose/nerdtree"
" Bundle "terryma/vim-multiple-cursors"
" Bundle "airblade/vim-gitgutter"
" Bundle "bling/vim-airline"
" Bundle "SuperTab"
" Bundle "panozzaj/vim-autocorrect"
" Bundle "sophacles/vim-bundle-sparkup"
" Bundle "greyblake/vim-preview"
" Bundle "garbas/vim-snipmate"
" Bundle "honza/vim-snippets"
" Bundle "YankRing.vim"
" Bundle "guns/xterm-color-table.vim"  " Can be helpful when picking colors

filetype plugin indent on  " and turn it back on!

runtime macros/matchit.vim
