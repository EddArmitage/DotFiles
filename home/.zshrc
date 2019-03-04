# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/Edd/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/local/bin/zsh-git-prompt/zshrc.sh
#PROMPT='%B%m%~%b$(git_super_status) %# '
NEWLINE=$'\n'
PROMPT='%(?.%F{green}✔%f.%F{red}✘%f) %F{yellow}%~%f $(git_super_status)${NEWLINE}%F{7}%T%f $ '
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[magenta]%}"
