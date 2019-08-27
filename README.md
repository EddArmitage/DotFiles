# Dotfiles

My [homesick](https://github.com/technicalpickles/homesick) dot files 
repository. Homesick is a neat way to keep config and preference files in-sync
across a number of machines. The basic functionality is achieved by creating
[symlinks](http://en.wikipedia.org/wiki/Symbolic_link) in your home directory
to files within a homesick repository, which typically exist in `~/.homesick/`.

This repo contains most of my dotfiles. For some things, such as my
`.gitconfig`, I maintain both a personal copy (in [this repo][personal-repo])
and my work equivalents in a repo at work.

## Vim
Like most people, my initial Vim config was provided to me by a friend. I've
since developed it to suit my tastes over time, although I still think it's
far from perfect, as I remain a novice vim-user.

## Bash

## Git
My [.gitconfig](home/.gitconfig) is pretty standard, with colours enabled and
my user-details provided. I specify my global [.gitignore](home/.gitignore) file
explicitly, and also enable KeyChain authentication on OS X.

My [.gitignore](home/.gitignore) is pretty basic, with all logs, packages,
bundles, executables and OS-generated meta-files ignored. I occasionally add
files to this as I change my tooling.

## Mercurial
My [.hgrc](home/.hgrc) file needs a bit of a review. It contains lots of things
to try and improve the output of the basic mercurial commands, such as using
`less` as a pager for viewing logs, and `meld` as a diff tool.


## Required Dependencies
* https://github.com/magicmonty/bash-git-prompt

 [personal-repo]: http://github.com/eddarmitage/dotfiles-personal
