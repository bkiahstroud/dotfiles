# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/kiah/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Quickly navigate to dev folder
alias cdd='cd ~/Development/'

# Quickly access .vimrc
alias vimrc='vim ~/.vimrc'

# Lazily get into stack_car bash
alias scb='sc be bash'

# Lazily get into stack_car rails console
alias scc='sc console'

# Make unified mode standard for diff command
alias diff='diff -u'

# Quickly get to saved code gists
alias vimcheats='vim ~/Development/code_cheat_sheet.txt'

# `docker-compose` shortcut
alias dc='docker-compose'

# Bash into web container
alias dcb='docker-compose exec web bash'

# `find` command searches for file name in current directory
# alias find='find . -name'

# Match other git shortcuts (`gd`, `ga`, etc)
alias gs='git status'

# Show diffs inline
alias gdc='git diff --color-words'

# Requires ohmyzsh git plugin
# Non-plugin equivalent: 'git pull && git fetch -ap'
alias glaf='gl && gfa'

# Update ohmyzsh and brew
alias upgrade='omz update && brew update && brew upgrade'

# Prefer using bat over cat
alias cat='bat'

# Prefer using exa over ls
alias ls='exa'

# Custom PATH export for executables / libraries
export PATH="./bin:$PATH:$HOME/scripts/dnuke:$HOME/scripts"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Path to anywhere from anywhere (prioritizes dev directories)
export CDPATH=".:/Users/kiah/Development:/Users/kiah/Development/personal:/Users/kiah/"

# Defaults for grep
# Note: for some reason, this causes the vim-gitgitter plugin to stop working
# export GREP_OPTIONS='-rn --exclude-dir=log --exclude-dir=tmp --exclude-dir=.bundle --exclude-dir=.config'
