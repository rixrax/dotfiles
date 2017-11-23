#! /bin/bash
HOME_DIR=${HOME}
DOTFILES_DIR="${HOME}/.dotfiles"

#Git
if [[ -f "$HOME_DIR/.gitconfig" && ! -L "$HOME_DIR/.gitconfig" ]]; then
    #Backup existing git config file
    #Notify user
    echo "Found existing git config file, moving it to $DOTFILES_DIR/backup/"
    cp "$HOME_DIR/.gitconfig" "$DOTFILES_DIR/backup/.gitconfig"
    rm "$HOME_DIR/.gitconfig"
fi
#Create symlink
if [[ ! -L "$HOME_DIR/.gitconfig" ]]; then
    ln -sn "$DOTFILES_DIR/git/.gitconfig" "$HOME_DIR/.gitconfig"
fi

#Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [[ -f "$HOME_DIR/.vimrc" && ! -L "$HOME_DIR/.vimrc" ]]; then
    #Backup vim config file
    #Notify user
    echo "Found existing vim config file, moving it to $DOTFILES_DIR/backup/"
    cp "$HOME_DIR/.vimrc" "$DOTFILES_DIR/backup/.vimrc"
    rm "$HOME_DIR/.vimrc"
fi

if [[ ! -L "$HOME_DIR/.vimrc" ]]; then
    #Create symlink
    ln -sn "$DOTFILES_DIR/vim/vimrc" "$HOME_DIR/.vimrc"
fi
vim +PlugInstall +qall

