#!/bin/sh

#Install Dependencies
cd ~ && echo "Installing Dependencies"
sudo apt upgrade
sudo apt install htop neofetch ranger lf rofi yt-dlp syncthing imagemagick nodejs curl openssh wget mpd ncmpcpp mpv maim zsh neovim zathura-mupdf

#Install and apply my dotfiles
cd ~/dotfiles && echo "Creating symlinks"
git submodule update --init
ln -s $HOME/dotfiles/Backgrounds ~/Pictures
ln -s $HOME/dotfiles/config/* ~/.config
ln -s $HOME/dotfiles/.zshenv ~
sudo ln -sf $HOME/dotfiles/fonts/* /usr/share/fonts
sudo ln -sf $HOME/dotfiles/icons/* /usr/share/icons
sudo ln -sf $HOME/dotfiles/config/lf-ueberzug/* /usr/local/bin
sudo ln -sf $HOME/dotfiles/themes/* /usr/share/themes

#Change theme for bat
bat cache --build

#Change shell to zsh
chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh
