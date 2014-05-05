# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jonathan-customized"
# ZSH_THEME="agnoster"
# ZSH_THEME="eastwood"
# ZSH_THEME="gallois"
# ZSH_THEME="suvash"
# ZSH_THEME="amuse"
# ZSH_THEME="ys"
# ZSH_THEME="jonathan"
# ZSH_THEME="pure"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# for python
export PATH=/usr/local/Cellar/python:$PATH

# for meld
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# for pipe2eval
export PIP2EVAL_TMP_FILE_PATH=/tmp/shms

# for rbenv
export RBENV_ROOT=$HOME/.rbenv

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git ruby bundler brew gem rvm)
plugins=(brew tmux tmuxinator capistrano git gitfast osx rbenv ruby gem bundler\
         python pip mix colored-man)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/base16-railscasts.dark.sh

# Customize to your needs...
export PATH=/usr/local/bin:$PATH
export EDITOR=vim
alias vim="mvim -v"

alias bi="bundle install --path vendor/bundle"
alias bil="bi --local"
alias binit="bi && bundle package"
