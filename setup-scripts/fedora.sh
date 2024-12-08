#!/bin/sh
#Install Dependencies
cd ~ && echo "Installing Dependencies"
sudo dnf install arandr acpi rustup pnpm kitty elogind rofi picom yt-dlp syncthing ImageMagick  
sudo dnf install nodejs pnpm git bat papirus-icon-theme papirus-folders lf ffmpeg ghostscript zip unzip gzip 
sudo dnf install bluedevil libspa-bluetooth lxappearance libX11-devel libXinerama-devel libXft-devel xsetroot curl openssh wget bspwm htop pipewire openjdk-jre mpd ncmpcpp sxhkd xclip dunst mpv maim 
sudo dnf install libreoffice 
sudo dnf install --skip-unavailable gcc clang zig qt5-graphicaleffects qt5-quickcontrols2 zsh neovim polybar jsoncpp feh zathura-pdf-mupdf hplip cups simple-scan ntfs-3g udisks2
sudo xbps-remove -R gnome-keyring
#creating directories
echo "Creating directories"
sudo mkdir -p /usr/local/bin
sudo mkdir -p /usr/share
mkdir -p $HOME/Pictures
mkdir -p $HOME/Documents
mkdir -p $HOME/Downloads
mkdir -p $HOME/Music
mkdir -p $HOME/Videos
papirus-folders -C cyan --theme Papirus-Dark
#Install and apply my dotfiles
cd ~/dotfiles && echo "Creating symlinks"
git submodule update --init
ln -sf $HOME/dotfiles/config/* ~/.config
ln -sf $HOME/dotfiles/.zshenv ~
sudo cp -r $HOME/dotfiles/fonts/* /usr/share/fonts
sudo ln -sf $HOME/dotfiles/icons/* /usr/share/icons
sudo ln -sf $HOME/dotfiles/themes/* /usr/share/themes
#Change theme for bat
bat cache --build
#Change shell to zsh
chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh
#NVim
rustup toolchain install nightly
sudo dnf install tree-sitter zoxide lazygit ripgrep sqlite fd yarn lldb nvm gcc
cd ~
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

