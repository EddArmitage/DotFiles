#Dotfiles

My [homesick](https://github.com/technicalpickles/homesick) dot files 
repository. Homesick is a neat way to keep config and preference files in-sync
across a number of machines. The basic functionality is achieved by creating
[symlinks](http://en.wikipedia.org/wiki/Symbolic_link) in your home directory
to files within a homesick repository, which typically exist in `~/.homesick/`.

##Vim
Like most people, my initial Vim config was provided to me by a friend. I've
since developed it to suit my tastes over time, although I still think it's
far from perfect, as I remain a novice vim-user.

###Pathogen
Relatively recently I've been made aware of
[Pathogen](https://github.com/tpope/vim-pathogen) to manage Vim plugins. I
particuarly like it because I've been able to install it in such a way that I
can install plugins into my
[homesick](https://github.com/technicalpickles/homesick) repository as _git
submodules_, giving me versioning without having to manually keep `foo.vim`
files up to date.

##Bash

##Git
My [.gitconfig](home/.gitconfig) is pretty standard, with colours enabled and
my user-details provided. I specify my global [.gitignore](home/.gitignore) file
explicitly, and also enable KeyChain authentication on OS X.

My [.gitignore](home/.gitignore) is pretty basic, with all logs, packages,
bundles, executables and OS-generated meta-files ignored. I occasionally add
files to this as I change my tooling.

##Mercurial
My [.hgrc](home/.hgrc) file needs a bit of a review. It contains lots of things
to try and improve the output of the basic mercurial commands, such as using
`less` as a pager for viewing logs, and `meld` as a diff tool.
