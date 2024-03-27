#!/bin/sh

#Install Dependencies
cd ~ && echo "Installing Dependencies"
sudo apt upgrade
sudo apt install kitty htop neofetch ranger rofi yt-dlp syncthing imagemagick nodejs curl wget mpd ncmpcpp mpv maim zsh neovim zathura bspwm sxhkd feh picom lxappearance libxcb-xinerama0-dev libpcre2-dev libpcre3-dev

#Install and apply my dotfiles
cd ~/dotfiles && echo "Creating symlinks"
git submodule update --init
ln -s $HOME/dotfiles/Backgrounds ~/Pictures
ln -s $HOME/dotfiles/config/* ~/.config
ln -s $HOME/dotfiles/.zshenv ~
sudo ln -sf $HOME/dotfiles/fonts/* /usr/share/fonts
sudo ln -sf $HOME/dotfiles/icons/* /usr/share/icons
sudo ln -sf $HOME/dotfiles/themes/* /usr/share/themes

#polybar
echo "Installing Dependencies"
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
echo "optional dependencies"
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
echo "cloning source code"
git clone --recursive https://github.com/polybar/polybar
cd polybar
echo "building polybar"
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
cd ~

#lf file manager
mkdir $HOME/.local/bin 
curl -L https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | tar xzC ~/.local/bin

#Change theme for bat
bat cache --build

#Change shell to zsh
chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh
