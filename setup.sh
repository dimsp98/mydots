#!/bin/bash

#Install Dependencies
cd ~ && echo "Installing Dependencies"
sudo pacman -S --needed base-devel git bat papirus-icon-theme lxappearance xorg-xsetroot curl openssh wget bspwm ranger htop pulseaudio pavucontrol jre-openjdk cmus reflector rofi sxhkd xclip dunst mpv maim syncthing libreoffice-fresh zip unzip gzip udiskie neofetch firefox sddm qt5-graphicaleffects qt5-quickcontrols2 zsh neovim polybar jsoncpp feh ueberzug zathura-pdf-mupdf hplip cups simple-scan ntfs-3g 
cd ~ && git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru -S picom-git zoom zotero-bin 

#Setting up services
sudo systemctl enable sddm
sudo systemctl enable cups

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
sudo ln -s $HOME/dotfiles/fonts /usr/share
sudo ln -s $HOME/dotfiles/themes /usr/share/
sudo ln -s $HOME/dotfiles/icons /usr/share
touch ~/.histfile

#make essential scripts executable
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/sxhkdrc
chmod +x ~/.config/bspwm/autostart.sh
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/ranger/scope.sh

#St and dmenu
cd ~/dotfiles/suckless/st && sudo make clean install

#Change shell to zsh
chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh 

#AstroNVim
sudo pacman -S --needed tree-sitter ripgrep gdu bottom && cd ~ 
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync

#SDDM THEME
cd ~
sudo git clone https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
sudo cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf
