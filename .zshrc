# ------------------------------------------------------------------------------
# First,   run /etc/zshenv,   then ~/.zshenv
#   # Empty

# Second,  run /etc/zprofile, then ~/.zprofile  (only login shells)
#   # Empty

# Third,   run /etc/zshrc,    then ~/.zshrc     (only interactive shells)
#   (This file)

# Finally, run /etc/zlogin,   then ~/.zlogin    (only login shells)
#   # Make sure /usr/local/bin is at the head of $PATH (for Brew)
#   export PATH=/usr/local/bin:$PATH
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# OH-MY-ZSH Configuration
# ------------------------------------------------------------------------------
# Path to your oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
# # Optionally, if you set this to "random",
# #   it'll load a random theme each time that oh-my-zsh is loaded.
#
# # Other themes I kinda liked:
# # agnoster, eastwood, gallois, suvash, amuse, ys, jonathan, pure
ZSH_THEME="jonathan-customized"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git ruby bundler brew gem rvm)
plugins=(osx brew python pip tmuxinator tmux gitfast git rbenv ruby gem bundler colored-man)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/base16-railscasts.dark.sh  # Configure Console colors


# ------------------------------------------------------------------------------
# Customize to your needs...
# ------------------------------------------------------------------------------
# for python
export PATH=/usr/local/Cellar/python:$PATH

# for meld
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# for pipe2eval
export PIP2EVAL_TMP_FILE_PATH=/tmp/shms

# for rbenv
export RBENV_ROOT=$HOME/.rbenv

export EDITOR=vim
alias vim="mvim -v"

alias bi="bundle install --path vendor/bundle"
alias bil="bi --local"
alias binit="bi && bundle package"

# Because: pretty
archey -c
