#!/bin/bash

#Install Dependencies
cd ~ && echo "Installing Dependencies"
sudo pacman -S neovim
sudo nvim /etc/pacman.conf
sudo pacman -S --needed rofi syncthing kitty yt-dlp imagemagick nodejs pnpm base-devel picom git bat papirus-icon-theme lf ffmpeg ghostscript zip unzip gzip curl openssh wget bspwm htop pavucontrol jre-openjdk cmus sxhkd xclip dunst mpv maim libreoffice-fresh sddm qt5-graphicaleffects qt5-quickcontrols2 zsh polybar jsoncpp feh zathura-pdf-mupdf hplip cups simple-scan ntfs-3g udisks2

#creating directories
echo "Creating directories"
create_default_directories() {
	rm -rf ~/.config/rofi
	rm -rf ~/.config/i3
	mkdir -p $HOME/.config && rm -rf $HOME/.config/user-dirs.dirs ln -sf $HOME/dotfiles/config/user-dirs.dirs ~/.config
	sudo mkdir -p /usr/local/bin
	sudo mkdir -p /usr/share
	mkdir -p "$HOME"/Pictures
	mkdir -p "$HOME"/Documents
	mkdir -p "$HOME"/Downloads
	mkdir -p "$HOME"/Music
	mkdir -p "$HOME"/Videos
}

#Install and apply my dotfiles
cd ~/dotfiles && echo "Creating symlinks"
git submodule update --init
ln -s $HOME/dotfiles/config/* ~/.config
ln -s $HOME/dotfiles/.zshenv ~
sudo ln -sf $HOME/dotfiles/fonts/* /usr/share/fonts
sudo ln -sf $HOME/dotfiles/icons/* /usr/share/icons
sudo ln -sf $HOME/dotfiles/themes /usr/share/themes

yay -S zoom zotero-bin nvm pfetch-rs-bin

#Change shell to zsh
chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh

#NVim
sudo pacman -S --needed tree-sitter lazygit ripgrep sqlite fd yarn lldb && cd ~
if command -v curl >/dev/null 2>&1; then
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ayamir/nvimdots/HEAD/scripts/install.sh)"
else
	bash -c "$(wget -O- https://raw.githubusercontent.com/ayamir/nvimdots/HEAD/scripts/install.sh)"
fi

#SDDM THEME
cd ~
sudo git clone https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
sudo cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf
