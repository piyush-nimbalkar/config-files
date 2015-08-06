# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails extract debian bundler vagrant)

# Zsh related configs
source $ZSH/oh-my-zsh.sh
source /usr/share/autojump/autojump.zsh

# Python virtualenv wrapper script
source /usr/local/bin/virtualenvwrapper.sh

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

autoload -U compinit && compinit

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Aliases
alias s='source ~/.zshrc'
alias q='exit'
alias c='clear'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias emacs-terminal='emacs -nw'
alias emacs='emacs'
alias sl='sl'
alias gs='git status'
alias cpr='rsync -av --progress'
alias ....='cd ../../..'
alias moo='fortune | cowthink'
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias python='/usr/bin/python'
alias gdc='git diff --cached'
# alias python=python3

export EDITOR='emacsclient -t'
export VISUAL='emacsclient -t'

# Add splunk binaries to PATH
export SPLUNK_HOME=/opt/splunk
export PATH=$SPLUNK_HOME/bin:$PATH

# Sun JDK PATH
export JAVA_HOME=/var/local/oab/src/x64-jdk
export PATH=$JAVA_HOME/bin:$PATH

moo

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# To store the virtual envs in a single directory
export WORKON_HOME=~/.virtualenvs

# Setup zsh-autosuggestions
source /home/piyush/.zsh-autosuggestions/autosuggestions.zsh
AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=4'
# Enable autosuggestions automatically
zle-line-init() {
zle autosuggest-start
}

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
