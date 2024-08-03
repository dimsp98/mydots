#!/bin/sh
#Create bspwm session
sudo touch /usr/share/xsessions/bspwm.desktop
echo "[Desktop Entry]
Name=bspwm
Comment=Binary space partitioning window manager
Exec=dbus-run-session bspwm
Type=Application" | sudo tee /usr/share/xsessions/bspwm.desktop
#Install Dependencies
cd ~ && echo "Installing Dependencies"
sudo pacman -Syyu
sudo pacman -S arandr awesome acpi bluez qt6-qt5compat rustup pnpm kitty elogind rofi picom yt-dlp syncthing ImageMagick
sudo pacman -S base-devel git bat papirus-icon-theme papirus-folders lf ffmpeg ghostscript zip unzip gzip 
sudo pacman -S firefox libreoffice-fresh
sudo pacman -S zsh neovim polybar jsoncpp feh zathura-pdf-mupdf hplip cups simple-scan
#creating directories
echo "Creating directories"
mkdir -p $HOME/.config
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
#paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
bat cache --build
#paru packages
paru -S brave-bin zotero-bin
#Change shell to zsh
chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh
#NVim
rustup toolchain install nightly
sudo xbps-install tree-sitter zoxide lazygit ripgrep sqlite fd yarn lldb nvm gcc
cd ~
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
#Dual-boot Timezone
echo "HARDWARECLOCK="localtime"" | sudo tee /etc/rc.conf
#Arc Icon theme for awesomewm widgets
cd $HOME/.local/share/icons/ 
git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
./autogen.sh --prefix=/usr
sudo make Install
cd ~
#Setting up services
echo -e "Setting up servicces"
sudo ln -s /etc/sv/cupsd /var/service
