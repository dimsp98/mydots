#dwm
echo "installing dwm"
cd ~ && git clone https://github.com/dimsp98/dwm.git ~/.dwm
cd .dwm && sudo make clean install
cd ~
git clone https://github.com/dimsp98/slstatus.git ~/slstatus
cd slstatus && sudo make clean install
cd ~
git clone https://github.com/dimsp98/dmenu.git
cd dmenu && sudo make clean install
sudo touch /usr/share/xsessions/dwm.desktop
echo "[Desktop Entry]
Encoding=UTF-8
Name=Dwm
Comment=Dynamic window manager
Exec=dbus-run-session dwm
Icon=dwm
Type=XSession" | sudo tee -a /usr/share/xsessions/dwm.desktop
