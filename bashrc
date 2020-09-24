export PATH=/usr/local/bin:$PATH

# Bash-Completion for Git
if [ -f `/usr/local/bin/brew --prefix`/etc/bash_completion ]; then
  . `/usr/local/bin/brew --prefix`/etc/bash_completion
fi

# Prompt stuff
 # git-prompt http://github.com/llv/git-prompt
[[ $- == *i* ]] && . ~/Code/Shell/git-prompt/git-prompt.sh

 # Josh's elite prompt
#if [ -f ~/.bash_files/prompts/elite ]; then
#  . ~/.bash_files/prompts/elite
#  elite
#fi

export EDITOR=vim

# Alias for Vim
alias vim="mvim -v"

# Aliases for Bundler
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

echo "Everytime you see this, you'll think of all the fun times we had at Insight Cards. Those were the days!"
