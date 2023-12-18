# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ihnfsa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Plugin
# Plugin name: zsh-autosuggestions
# How to install: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Plugin (not recommanded, it's slow in a large project)
# Plugin name: zsh-git-prompt
# How to install: git clone https://github.com/ihnfsax/zsh-git-prompt.git ~/.zsh/zsh-git-prompt
# source ~/.zsh/zsh-git-prompt/zshrc.sh

# Initialize colors.
autoload -U colors
colors
# Allow for functions in the prompt.
setopt PROMPT_SUBST
# PROMPT
my_prompt() {
    echo -n "%(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) %F{red}%(?..%? )"
    #     echo -n "%(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) $(git_super_status)" # For git prompt
    echo -n "\n"
    echo -n "%F{blue}%(!.#.$)%k%b%f "
}
PROMPT='$(my_prompt)'

# Change key bindings for Ctrl + Left/Right
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Set language for terminal to English
export LANGUAGE=en_US # Chinese: zh_CN:en_US:en
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Proxy
unsetproxy() {
    unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
}
setproxy() {
    export http_proxy=
    export https_proxy=
    export HTTP_PROXY=
    export HTTPS_PROXY=
}
echoproxy() {
    echo "http_proxy=${http_proxy}"
    echo "https_proxy=${https_proxy}"
    echo "HTTP_PROXY=${HTTP_PROXY}"
    echo "HTTPS_PROXY=${HTTPS_PROXY}"
}
setproxy

# EDITOR
export EDITOR="/usr/bin/vim"
export GITEDITOR="/usr/bin/vim"

# aliases
alias tree2="tree -aI '.git' -L 2 ."
alias tree3="tree -aI '.git' -L 3 ."
alias ll="ls -alhF"
# alias ll="eza --icons -aalgFhb"
alias nv="nvim"
alias tmux="tmux -u"

# Plugin (this plugin must be source at the end of ~/.zshrc)
# Plugin name: zsh-syntax-highlighting
# How to install: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
