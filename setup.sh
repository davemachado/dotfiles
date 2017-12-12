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

if [ ! -f ~/.local_aliases ]; then
	touch ~/.local_aliases
fi

if [ ! -f ~/.z.sh ]; then
	curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.z.sh
fi

if [ -d ~/.oh-my-zsh ]; then
	echo "$HOME/.oh-my-zsh already exists, skipping install"
else
	sh -c "\$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ -d ~/.zsh-syntax-highlighting ]; then
	echo "$HOME/.zsh-syntax-highlighting already exists, skipping install"
else
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting
fi

if [ "$cd_back" != "" ]; then
    echo "cd-ing back to $cd_back"
    cd $cd_back
fi
