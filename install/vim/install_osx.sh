#!/bin/sh
# Install latest vim and MacVim for OSX.
#
# WARNING: This is a destructive install that will override .vimrc and vim
# plugins.

SCRIPT_DIR=$(dirname $0)

brew install macvim --with-override-system-vim
brew install vim
brew install cmake
brew linkapps

# Configure plugins
mkdir -p ~/.vim/bundle
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://www.github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
cp $SCRIPT_DIR/../../.vimrc ~

vim +PluginClean! +qall
vim +PluginInstall! +qall
vim +PluginUpdate! +qall
mkdir -p ~/.vim/undodir

# Compile YouCompleteMe.
# For OSX, this requires XCode.
(cd ~/.vim/bundle/YouCompleteMe; ./install.py)

echo
echo "===================="
echo
echo "To launch the new vim, ensure your PATH is configured with /usr/local/bin"
echo "before /usr/bin."
echo "PATH=$PATH"
