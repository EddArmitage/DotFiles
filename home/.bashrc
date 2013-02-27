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
fi


#~~~Environment Variables~~~
export EDITOR=vim

#~~~Colours~~~
#Allow some shiny, shiny colours.
export CLICOLOR='true'

#Change LS colour scheme to be viewable on a black background.
export LSCOLORS=gxfxcxdxbxegedabagacad

#~~~Framework/Environments~~~
if [[ "$platform" == 'mac' ]]
then
	eval "$(rbenv init -)"
elif [[ "$platform" == 'linux' ]]
then 
	export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib
fi

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
#Do funky autocompletion in SSH. Uses .bash_history
complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh

if [[ "$platform" == 'mac' ]]
then
	#Do funky autocompletion for homebrew
	source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi

