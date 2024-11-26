sudo pacman -S --needed --noconfirm - <./arch-official-packages.txt

mv ./exclude-config.sh ./config.sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo cp -r ./tmux.conf $HOME/.tmux.conf
