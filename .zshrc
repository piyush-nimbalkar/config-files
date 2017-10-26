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
plugins=(git golang vagrant sudo docker)

# Zsh related configs
source $ZSH/oh-my-zsh.sh
source /usr/share/autojump/autojump.zsh

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
alias e='TERM=xterm-256color emacsclient -t'
alias ec='emacsclient -c'
alias emacs-terminal='emacs -nw'
alias emacs='emacs'
alias gs='git status'
alias cpr='rsync -av --progress'
alias moo='fortune | cowthink'
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias python='/usr/bin/python'
alias gdc='git diff --cached'
alias tmux='TERM=xterm-256color tmux'
alias p='/home/piyush/workspace/src/github.com/portworx/porx/bin/pxctl'
export EDITOR='TERM=xterm-256color emacsclient -t'
export VISUAL=$EDITOR

export GOROOT=/usr/local/go
export GOPATH=/home/piyush/workspace
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export DOCKER_HUB_USER=piyushpx
export DOCKER_HUB_EMAIL=piyush@portworx.com
export DOCKER_HUB_REPO=$DOCKER_HUB_USER
export DOCKER_HUB_IMAGE=porx
export DOCKER_HUB_TORPEDO_IMAGE=torpedo
export DOCKER_HUB_TAG=latest

export KUBECONFIG=$HOME/workspace/px-cluster/admin.conf

# Change C-c (kill) to C-x, so that C-c/C-v could be used to copy/paste
stty intr ^X

# Check what the cow has to say
moo
