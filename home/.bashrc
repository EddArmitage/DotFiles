#! /bin/bash

#Detect the current OS
platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]
then
	platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]
then
	platform='mac'
fi

#Function for adding to $PATH so no duplicates
pathadd() {
	export 	PATH="$1:$PATH"
}

#~~~PATH updates~~~
if [[ "$platform" == 'linux' ]]
then
	pathadd "/home/edd/bin"
elif [[ "$platform" == 'mac' ]]
then
	pathadd "/usr/local/bin"
fi


#~~~Environment Variables~~~
export EDITOR=vim

#~~~Framework/Environments~~~
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
	source /usr/local/bin/virtualenvwrapper.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

#~~~Aliasing~~~
if [[ "$platform" == 'mac' ]]
then
	#Add alias to rmtrash
	hash rmtrash 2>&-
	if [ $? -eq 1 ]
	then
		echo >&2 "rmtrash command not found. trash not aliased."
	else
		alias trash=rmtrash
	fi
elif [[ "$platform" == 'linux' ]]
then
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
	stty erase ^?
	alias sqlplus='rlwrap sqlplus64'
fi

#~~~Autocompletions~~~
complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [[ "$platform" == 'mac' ]]
then
	#Do funky autocompletion for homebrew
	source "$(brew --prefix)/etc/bash_completion.d/brew"
fi

alias weather='curl -4 http://wttr.in/London'


#~~~Prompt~~~

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

#~~~Man Pages~~~
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		    man "$@"
}


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/Edd/.sdkman"
[[ -s "/Users/Edd/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/Edd/.sdkman/bin/sdkman-init.sh"
