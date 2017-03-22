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

