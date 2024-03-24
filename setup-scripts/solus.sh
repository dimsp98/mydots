#!/bin/sh

#Install Dependencies
cd ~ && echo "Installing Dependencies"
sudo eopkg upgrade
sudo eopkg install alacritty nemo rofi picom yt-dlp syncthing imagemagick nodejs pnpm xorg xf86-video-nouveau base-devel git bat papirus-icon-theme papirus-folders lf ueberzug ffmpeg ghostscript zip unzip gzip lxappearance xsetroot curl openssh wget bspwm htop pulseaudio pamixer pavucontrol alsa-plugins-pulseaudio openjdk-jre mpd ncmpcpp sxhkd xclip dunst mpv maim pfetch zsh neovim polybar jsoncpp feh zathura-pdf-mupdf hplip cups simple-scan

#folder icons
papirus-folders -C cyan --theme Papirus-Dark

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

#NVim
sudo eopkg install tree-sitter lazygit ripgrep sqlite fd yarn lldb nvm && cd ~
