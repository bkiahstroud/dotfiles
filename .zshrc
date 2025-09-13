# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export PATH="/opt/homebrew/bin:$PATH"

# Speed up auto-completions
autoload -Uz compinit && compinit -i

zstyle ':omz:plugins:eza' 'icons' yes

# Override default zoxide alias "z" to "cd"
# ZOXIDE_CMD_OVERRIDE=cd

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws
  colored-man-pages
  docker
  docker-compose
  eza
  gh
  git
  gitfast
  golang
  helm
  kubectl
  ssh
  # zoxide
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source <(kubectl stern --completion zsh)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

eval "$(/opt/homebrew/bin/brew shellenv)"
# eval "$(rbenv init - zsh)"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Quickly navigate to dev folder
alias cdd='cd ~/dev/'

# Use Neovim instead of Vim
# alias vim="nvim"
# alias oldvim="\vim"

# Quickly access .vimrc
alias vimrc='vim ~/.vimrc'

# Lazily get into stack_car rails console
alias scc='sc console'

# Make unified mode standard for diff command
# alias diff='diff -u'

# Quickly get to saved code gists
alias vimcheats='vim ~/dev/code_cheat_sheet.txt'

# `docker compose` shortcut
alias dc='docker compose'

# `find` command searches for file name in current directory
# alias find='find . -name'

# Match other git shortcuts (`gd`, `ga`, etc)
alias gs='git status'

# Show diffs inline
alias gdc='git diff --color-words'

# Push current branch and set upstream tracking to origin
alias gpo='git push -u origin $(git_current_branch)'

alias glaf='git pull && git fetch -ap'

alias gst='git stash'
alias gstp='git stash pop'
alias gsts='git stash show -p'

# Update ohmyzsh and brew
alias upgrade='omz update && brew update && brew upgrade'

# Prefer using bat over cat
alias cat='bat'

# Lazy
alias osm='opensaysme'

# Copy markdown of commit message(s) for MR/PR descriptions
alias gdesc='git log --reverse --pretty="format:## %s%n%n%H%n%n%b" main.. | pbcopy'

alias dk='docker compose -f docker-compose-koppie.yml'

alias t='task'
alias ta='task add'
alias ts='task sync'
alias tu='task rc.context=none'
alias tt='taskwarrior-tui'

alias k='kubectl'

alias v='nvim'

# alias z='zellij -l welcome'
alias z='zellij'
alias zinit='zellij attach --create-background home; zellij --session home action launch-or-focus-plugin --floating --configuration cwd="/Users/kiah",root_dirs="/Users/kiah/dev",session_layout=":compact" file:~/.config/zellij/plugins/zellij-sessionizer.wasm; zellij attach home'

alias gcs='gh copilot suggest'
alias gce='gh copilot explain'

# alias gpg='gpg2'

alias clast='fc -ln -1 | pbcopy'

alias ld='lazydocker'
alias lg='lazygit'

# Accept suggestion from zsh-autosuggestions plugin
bindkey '^n' autosuggest-accept

# Custom PATH export for executables / libraries
export PATH="$PATH:$HOME/scripts/dnuke:$HOME/scripts"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# export PATH="$PATH:$HOME/.rvm/bin"

# Doom Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# WSL binaries
export PATH="$HOME/.local/bin:$PATH"

# Go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

# sqlite
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# Path to anywhere from anywhere (prioritizes dev directories)
export CDPATH=".:$HOME/dev:$HOME/dev/personal:$HOME"

# Defaults for grep
# Note: for some reason, this causes the vim-gitgitter plugin to stop working
# export GREP_OPTIONS='-rn --exclude-dir=log --exclude-dir=tmp --exclude-dir=.bundle --exclude-dir=.config'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
# Use robbyrussell's zsh theme
# source $ZSH_CUSTOM/themes/powerlevel10k/config/p10k-robbyrussell.zsh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export KUBECONFIG=~/.kube/config:~/.kube/vizer

# Java / Ant
export ANT_HOME="/Users/kiah/dependencies/apache-ant-1.10.12"
export JAVA_HOME="/opt/homebrew/opt/openjdk"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$ANT_HOME/bin:$PATH"

export DOOMDIR="$HOME/.doom.d"

export EDITOR="/opt/homebrew/bin/nvim"

export GPG_TTY=$(tty)

eval "$(starship init zsh)"
eval "$(atuin init zsh)"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
