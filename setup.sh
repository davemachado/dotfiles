#!/bin/sh

dotdir="$HOME/.dotfiles"

if [ $PWD != $dotdir ]; then
    cd_back=$PWD
    echo "cd-ing to $dotdir"
    cd $dotdir
fi

if [ -d ~/.vim ]; then
	mv ~/.vim ~/.vim-backup
fi
ln -s $dotdir/vim ~/.vim

if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc-backup
fi
ln -s $dotdir/vim/vimrc ~/.vimrc

if [ -f ~/.zshrc ]; then
	mv ~/.zshrc ~/.zshrc-backup
fi
ln -s $dotdir/zsh/zshrc ~/.zshrc

if [ -d ~/.oh-my-zsh ]; then
	echo "$HOME/.oh-my-zsh already exists, skipping install"
else
	sh -c "\$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ $cd_back != "" ]; then
    echo "cd-ing back to $cd_back"
    cd $cd_back
fi
