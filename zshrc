# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(git golang vagrant sudo docker kubectl zsh-syntax-highlighting zsh-autosuggestions)

# Zsh related configs
source $ZSH/oh-my-zsh.sh

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
alias emacs='emacsclient -t'
alias gs='git status'
alias cpr='rsync -av --progress'
alias moo='fortune | cowthink'
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias python='/usr/bin/python'
alias gdc='git diff --cached'

# Portworx aliases
alias p='$HOME/workspace/src/github.com/portworx/porx/bin/pxctl'
alias kk='kubectl'
alias kn='kubectl -n kube-system'

function pk () {
     pxpod=$(kubectl -n kube-system get pods | grep portworx- | grep Running | head -n1 | cut -d' ' -f1)
     kubectl -n kube-system exec -it $pxpod /opt/pwx/bin/pxctl -- $@
}

export EDITOR='emacsclient -t'
export VISUAL=$EDITOR

export GOROOT=/usr/local/go
export GOPATH=$HOME/workspace
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Add emacsclient path to $PATH
export PATH=/Applications/Emacs.app/Contents/MacOS/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Portworx exports
export DOCKER_HUB_USER=piyushpx
export DOCKER_HUB_EMAIL=piyush@portworx.com
export DOCKER_HUB_REPO=$DOCKER_HUB_USER
export DOCKER_HUB_IMAGE=porx
export DOCKER_HUB_TORPEDO_IMAGE=torpedo
export DOCKER_HUB_TAG=latest

export S3_RELEASE_BUCKET=px-dcos
export HTTP_RELEASE_SERVER=https://px-dcos.s3.amazonaws.com
export S3_BUCKET=piyush-dcos
export S3_DIR_PATH=try40

# DCOS cluster
export DCOS_GENERATE_CONFIG_PATH=dcos_generate_config.ee.sh
export DCOS_CONFIG_PATH=etc/config-1.11.yaml

export KUBECONFIG=$HOME/workspace/src/github.com/vagrant-kube/admin.conf

# Autojump prefix was not getting loaded (Mac)
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Check what the cow has to say
moo

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
