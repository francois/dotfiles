# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="maran"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
export DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
export HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler ruby osx)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH:$HOME/perl5/man:/usr/local/opt/erlang/lib/erlang/man"
export PATH="/usr/local/bin:$( yarn global bin ):/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cabal/bin:$HOME/perl5/bin:$PATH"
test -d "${HOME}/bin" && export PATH="${HOME}/bin:${PATH}"

# You may need to manually set your language environment
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANGUAGE=en_US

# Always prefer vim for editing
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# EC2
export EC2_CERT=$HOME/.ec2/certificate.pem
export EC2_PRIVATE_KEY=$HOME/.ec2/privkey.pem

# Configure ZSH history the way I want it: per shell history
# Up-Arrow should always give the previous command, even if I've moved between shells / terminals / tabs
export APPEND_HISTORY="true"
export HIST_IGNORE_DUPS="true"
export INC_APPEND_HISTORY="false"
export SHARE_HISTORY="false"

# Example aliases
# alias gl='git log --decorate --graph --oneline -n 40'
alias gl='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset" -n 40'
alias gs='git status --short'
alias gpull='git pull'
alias gpush='git push'
alias ga='git add'
alias gaa='git add --all'
alias gd='git diff --color-moved'
alias gdc='git diff --cached --color-moved'
alias gwip='git add --all && git commit --no-signoff --no-verify --message "WIP" && git push'
alias gsw='git switch'
alias gswc='git switch --create'
alias gc='git commit --verbose -S'
alias gca='git commit --verbose --all -S'

alias vim='nvim'
alias view='nvim -R'

export PERL_MB_OPT="--install_base \"/home/${USER}/perl5\""; export PERL_MB_OPT;
export PERL_MM_OPT="INSTALL_BASE=/home/${USER}/perl5"; export PERL_MM_OPT;
export PERL5LIB="$HOME/perl5/lib/perl5"
export LESS="-RFX ${LESS}"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PS1='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[yellow]%}%M:$(get_pwd)%{$reset_color%}$(git_prompt_info)
%(!.#.$) '
export REVIEW_BASE=master

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# . /usr/local/opt/asdf/asdf.sh
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export GPG_TTY=$(tty)
