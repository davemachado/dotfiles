# If you come from bash you might have to change your $PATH.
# Add ~/bin to PATH
export PATH=$HOME/bin:$PATH
# Add pwd to PATH
export PATH=.:$PATH
# Privacy, please
export HOMEBREW_NO_ANALYTICS=1
# For Rust
export PATH=$PATH:$HOME/.cargo/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

setopt nosharehistory

# Keep oodles of command history
HISTSIZE=1000000
SAVEHIST=1000000
setopt INC_APPEND_HISTORY
#setopt APPEND_HISTORY

# Allow tab completion in the middle of a word.
setopt COMPLETE_IN_WORD

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="zhann"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew git osx)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.z.sh
source $HOME/.command-time.zsh
ZSH_COMMAND_TIME_MIN_SECONDS=5
ZSH_COMMAND_TIME_MSG="Execution time: %s"
ZSH_COMMAND_TIME_COLOR="cyan"

# Local profile (not part of VCS)
LOCAL_PROFILE="$HOME/.zsh_local_profile"
alias localzsh="$EDITOR $LOCAL_PROFILE"
source $LOCAL_PROFILE

function dtm {
  echo -ne "\033]50;SetProfile=Dark\a"
  export ITERM_PROFILE="Dark"
}

function ltm {
  echo -ne "\033]50;SetProfile=Light\a"
  export ITERM_PROFILE="Light"
}

function colorize {
  if [[ "$(uname -s)" == "Darwin" ]]; then
    val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
    if [[ $val != "Dark" ]]; then
        ltm
    else
        dtm
    fi
  fi
}
colorize

# Avoid unnecessary prompts (avoid slow-down and risk of wrong answer)
# This option is only supported by GNU coreutils, not by the
# BSD versions that come with OS X. It’s possible to install
# GNU coreutils, e.g. with brew install coreutils. To override the builtins,
# follow the instructions printed by brew info coreutils
alias cp='cp --backup=numbered'
alias ln='ln --backup=numbered'
alias mv='mv -f --backup=numbered'

# Type in a few chars of a command in history and use arrow (up/down) keys to cycle
# through all commands that start with the typed in chars.
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Vim mode things
bindkey -v
bindkey '^r' history-incremental-search-backward
# BEGIN PROMPT
function nonzero_return() {
	RETVAL=$?
    SIGNAME=$(kill -l ${RETVAL})
    [ $RETVAL -ne 0 ] && echo "[%{$fg[red]%}EXIT $RETVAL ($SIGNAME)%{$reset_color%}] "
}

autoload -U colors && colors
function hgproml {
  local user="%{$fg[green]%}%n"
  local at="%{$fg[yellow]%}@"
  local host="%{$fg[green]%}%m"
  local dir="%{$fg[blue]%}%c"

  export PS1="\$(nonzero_return)$user$at$host%{$fg[yellow]%}:\$(_scm_prompt) $dir %{$reset_color%}$ "
  PS2='> '
  PS4='+ '
}
hgproml
# END PROMPT

# ALIASES
alias temacs='emacs --no-window-system'
alias oew=emacs
alias oe=temacs

alias bp='$EDITOR ~/.zshrc'
alias src='source ~/.zshrc'
alias vp='$EDITOR ~/.vimrc'
alias tp='$EDITOR ~/.tmux.conf'
alias ls='ls -gGh'
alias l='ls'
alias sl=ls
alias lf='find . -maxdepth 1 -type f'
alias ldir='ls -d */'
alias ~='cd ~'
alias e=$EDITOR
alias o=open
alias oa='open -a'
alias c=clear
alias h=history
alias x=exit
alias path='echo -e ${PATH//:/\\n}'
alias now=date
alias zs='zsh_stats'
alias trashit='rm -rf ~/.Trash/'
alias gupdate='git fetch upstream && git rebase upstream/master'
alias glr='git pull --rebase'
alias bup='brew update && brew upgrade'
alias remake="make clean && make"


alias p2='python'
alias p3='python3'
alias mongod='mongod --dbpath $HOME/.mongodb/data'

# Web Shortcuts
alias chrome="open -a \"Google Chrome\""
alias gh="chrome http://github.com/davemachado"
alias email="chrome http://mail.google.com"

alias al=chives

# Scripts
alias mkgo=". mkgo"
alias vpnc="osascript ~/bin/vpn-connect"
alias vpnd="osascript ~/bin/vpn-disconnect"

alias svr="ssh svr -t \"tmux attach || tmux\" -u"

# Networking
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'
alias net='nmap -sn 192.168.0.0/24'
alias xip='curl https://myexternalip.com/raw'
