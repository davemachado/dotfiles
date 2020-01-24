export ZSH=$HOME/.oh-my-zsh

export DOTFILES="$HOME/.dotfiles"

# Vim 
export EDITOR="vim"
export MYVIMRC="$DOTFILES/vim/vimrc"

# ZSH
set ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

ZSHRC="$DOTFILES/zsh/zshrc"
alias zshrc="$EDITOR $ZSHRC"

# Custom Aliases
CUSTOM_ALIASES="$HOME/.custom_aliases"
alias custom="$EDITOR $CUSTOM_ALIASES"
source $CUSTOM_ALIASES

# Local Aliases (not part of VCS)
LOCAL_ALIASES="$HOME/.local_aliases"
alias localzsh="$EDITOR $LOCAL_ALIASES"
source $LOCAL_ALIASES

alias sourceall="source $CUSTOM_ALIASES;source $ZSHRC;source $LOCAL_ALIASES"

ZSH_THEME="zhann"
plugins=(git osx web-search tmux taskwarrior jsontools history tmuxinator brew)
ZSH_TMUX_AUTOSTART=false

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add ~/bin to PATH
export PATH=$HOME/bin:$PATH
# Add pwd to PATH
export PATH=.:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Syntax Highlighting installed from Homebrew
export GEM_HOME=$HOME/.gem

# Add Z to env
. $HOME/.z.sh

alias svr="ssh dev -t \"tmux attach || tmux\""

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
PATH=/Users/dmachado/.Pokemon-Terminal:$PATH
export PATH="/usr/local/opt/curl/bin:$PATH"

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
