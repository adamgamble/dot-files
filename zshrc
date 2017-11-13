# ------------------------------------------------------------------------------
# OH-MY-ZSH Configuration
# ------------------------------------------------------------------------------
# Path to your oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

# use another custom folder than $ZSH/custom
ZSH_CUSTOM=$HOME/dot-files/oh-my-zsh-custom

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
#   # Other themes I kinda liked:
#   # agnoster, eastwood, gallois, suvash, amuse, ys, jonathan, pure
ZSH_THEME="jonathan-customized"

# Which Oh-My-Zsh plugins to load?
plugins=(
  osx brew gnu-utils git gitfast colored-man colorize
  rbenv ruby gem rake rake-fast bundler rails
)


# ------------------------------------------------------------------------------
# ENV
# ------------------------------------------------------------------------------
# for fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# for rbenv
export RBENV_ROOT=$HOME/.rbenv

# for nvm
export NVM_DIR=$HOME/.nvm

# Vim
export EDITOR=vim

# cowsay
export COWPATH="$(brew --prefix cowsay)/share/cows:$HOME/.cows"

# GitHub Access Token for Homebrew
export HOMEBREW_GITHUB_API_TOKEN=$(<$HOME/.local/share/brew/GITHUB_TOKEN)

# GitHub Access Token for vim-github-dashboard
export VIM_GITHUB_DASHBOARD_API_TOKEN=$(<$HOME/.local/share/nvim/GITHUB_TOKEN)


# ------------------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------------------
# for erlenv
export PATH="$HOME/.erlenv/bin:$PATH"

# for exenv
export PATH="$HOME/.exenv/bin:$PATH"

# for python
export PATH=/usr/local/Cellar/python:$PATH

# local project-level bin directories -- `mkdir .git/safe` if trusted project
export PATH=.git/safe/../../bin:$PATH


# ------------------------------------------------------------------------------
# Personal aliases
# ------------------------------------------------------------------------------
# filter out ./vendor and ./tmp with tree
alias ti="tree -I 'vendor|tmp' --matchdirs"
alias vim="nvim"
# alias vim="mvim -v"
alias stree="/Applications/SourceTree.app/Contents/Resources/stree"


# ------------------------------------------------------------------------------
# actions to perform ...
# ------------------------------------------------------------------------------
# Vim
bindkey -v

# initialize rbenv
eval "$(rbenv init -)"

# initialize erlenv if it's there
# [[ -x $(which erlenv) ]] && eval "$(erlenv init -)"

# initialize exenv if it's there
# [[ -x $(which exenv) ]] && eval "$(exenv init -)"

# for nvm if it's there
# [[ -d $(brew --prefix nvm) ]] && source $(brew --prefix nvm)/nvm.sh

# start oh-my-zsh
source $ZSH/oh-my-zsh.sh

# setup fzf auto-completion and key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Because: pretty -- if it's there
[[ -x $(which archey) ]] && archey -c -o

# Got t3h L3rn!n...!
[ -f ~/.vocab ] && chmod +x ~/.vocab && ~/.vocab


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Notes on Zsh startup
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
# OH-MY-ZSH Configuration Notes
# ------------------------------------------------------------------------------
# Path to your oh-my-zsh configuration
# ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it will load a random theme each time
# that oh-my-zsh is loaded.
# ZSH_THEME="jonathan-customized"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git ruby bundler brew gem rvm)
# plugins=(
# systemadmin osx brew tmux colored-man colorize git gitfast
# rbenv ruby gem rake rake-fast bundler rails
# )

# source $ZSH/oh-my-zsh.sh
