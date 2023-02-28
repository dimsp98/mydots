#!/bin/bash

#Install Dependencies
cd ~ && echo "Installing Dependencies"
sudo xbps-install -Suv 
sudo xbps-install xorg base-devel elogind picom git bat xdg-user-dirs papirus-icon-theme lxappearance libX11-devel libXinerama-devel libXft-devel xsetroot curl openssh wget bspwm ranger htop pulseaudio pavucontrol alsa-plugins-pulseaudio openjdk-jre cmus rofi sxhkd xclip dunst mpv maim syncthing libreoffice zip unzip gzip udisks2 neofetch firefox sddm qt5-graphicaleffects qt5-quickcontrols2 zsh neovim polybar jsoncpp feh ueberzug zathura-pdf-mupdf hplip cups simple-scan ntfs-3g 
xdg-user-dirs-update 
cd ~ && git clone https://github.com/void-linux/void-packages.git
cd void-packages
./xbps-src binary-bootstrap
echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf

#Setting up services
sudo ln -s /etc/sv/cupsd /var/service 
sudo ln -s /etc/sv/dbus /var/service
sudo rm -rf /var/service/acpid

#Install and apply my dotfiles
cd ~/dotfiles
git submodule update --init
ln -s $HOME/dotfiles/Backgrounds ~/Pictures
ln -s $HOME/dotfiles/bat ~/.config
ln -s $HOME/dotfiles/bspwm ~/.config
ln -s $HOME/dotfiles/zathura ~/.config
ln -s $HOME/dotfiles/polybar ~/.config
ln -s $HOME/dotfiles/htop ~/.config
ln -s $HOME/dotfiles/dunst ~/.config
ln -s $HOME/dotfiles/zsh ~/.config
ln -s $HOME/dotfiles/neofetch ~/.config
ln -s $HOME/dotfiles/picom ~/.config
ln -s $HOME/dotfiles/ranger ~/.config
ln -s $HOME/dotfiles/rofi ~/.config
ln -s $HOME/dotfiles/.zshrc ~
ln -s $HOME/dotfiles/.p10k.zsh ~
ln -s $HOME/dotfiles/themes $HOME/.local/share 
ln -s $HOME/dotfiles/icons $HOME/.local/share
ln -s $HOME/dotfiles/fonts $HOME/.local/share
touch ~/.histfile

#St and dmenu
cd ~/dotfiles/suckless/st && sudo make clean install

#Change shell to zsh
chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh 

#AstroNVim
sudo xbps-install tree-sitter && cd ~ 
git clone https://github.com/Jint-lzxy/nvimconfig.git 
~/nvimconfig/scripts/install.sh

#Configure fonts
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo xbps-reconfigure -f fontconfig

#SDDM THEME
cd ~
sudo git clone https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
sudo cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf
sudo ln -s /etc/sv/sddm /var/service 

