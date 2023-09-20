#!/bin/sh

#Install Dependencies
cd ~ && echo "Installing Dependencies"
sudo apt install rofi picom yt-dlp syncthing ImageMagick nodejs pnpm base-devel bat papirus-icon-theme lf ueberzug ffmpeg ghostscript zip unzip gzip lxappearance libX11-devel libXinerama-devel libXft-devel xsetroot curl openssh wget bspwm htop pulseaudio pamixer pavucontrol alsa-plugins-pulseaudio openjdk-jre mpd ncmpcpp sxhkd xclip dunst mpv maim pfetch neovim polybar jsoncpp feh hplip cups simple-scan ntfs-3g udisks2 zsh -y

#creating directories
echo "Creating directories"
mkdir -p $HOME/.config && ln -sf $HOME/dotfiles/config/user-dirs.dirs ~/.config
sudo mkdir -p /usr/local/bin
sudo mkdir -p /usr/share
mkdir -p $HOME/Pictures
mkdir -p $HOME/Documents
mkdir -p $HOME/Downloads
mkdir -p $HOME/Music
mkdir -p $HOME/Videos

#Install and apply my dotfiles
cd ~/dotfiles && echo "Creating symlinks"
git submodule update --init
ln -s $HOME/dotfiles/Backgrounds ~/Pictures
ln -s $HOME/dotfiles/config/* ~/.config
ln -s $HOME/dotfiles/.zshenv ~
sudo ln -sf $HOME/dotfiles/fonts/* /usr/share/fonts
sudo ln -sf $HOME/dotfiles/icons/* /usr/share/icons
sudo ln -sf $HOME/dotfiles/config/lf-ueberzug/* /usr/local/bin
sudo ln -sf $HOME/dotfiles/themes /usr/share/themes

#Change theme for bat
bat cache --build

#Change shell to zsh
chsh -s /usr/bin/zsh && sudo chsh -s /usr/bin/zsh

#NVim
sudo apt-get install tree-sitter lazygit ripgrep sqlite fd yarn lldb nvm && cd ~
if command -v curl >/dev/null 2>&1; then
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ayamir/nvimdots/HEAD/scripts/install.sh)"
else
	bash -c "$(wget -O- https://raw.githubusercontent.com/ayamir/nvimdots/HEAD/scripts/install.sh)"
fi

#Setting up services
echo -e "Setting up servicces"
sudo systemctl enable cups
