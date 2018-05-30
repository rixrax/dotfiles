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

if [[ ! -L "$HOME_DIR/.gitconfig" ]]; then
    echo "Setting git config"
    #Create symlink
    ln -sn "$DOTFILES_DIR/git/.gitconfig" "$HOME_DIR/.gitconfig"
fi

#Vim
if [[ ! -f "$HOME_DIR/.vim/autoload/plug.vim" ]]; then
    echo "junegunn/vim-plug not found, downloading from github master..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [[ -f "$HOME_DIR/.vimrc" && ! -L "$HOME_DIR/.vimrc" ]]; then
    #Backup vim config file
    #Notify user
    echo "Found existing vim config file, moving it to $DOTFILES_DIR/backup/"
    cp "$HOME_DIR/.vimrc" "$DOTFILES_DIR/backup/.vimrc"
    rm "$HOME_DIR/.vimrc"
fi

if [[ ! -L "$HOME_DIR/.vimrc" ]]; then
    echo "Setting vim config"
    #Create symlink
    ln -sn "$DOTFILES_DIR/vim/vimrc" "$HOME_DIR/.vimrc"
    vim +PlugInstall +qall
fi

#Tmux
if [[ -f "$HOME_DIR/.tmux.conf" && ! -L "$HOME_DIR/.tmux.conf" ]]; then
    #Backup tmux config file
    #Notify user
    echo "Found existing tmux config file, moving it to $DOTFILES_DIR/backup/"
    cp "$HOME_DIR/.tmux.conf" "$DOTFILES_DIR/backup/.tmux.conf"
    rm "$HOME_DIR/.tmux.conf"
fi

if [[ ! -L "$HOME_DIR/.tmux.conf" ]]; then
    echo "Setting tmux config"
    #Create symlink
    ln -sn "$DOTFILES_DIR/tmux/tmux.conf" "$HOME_DIR/.tmux.conf"
fi

