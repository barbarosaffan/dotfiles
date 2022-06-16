sudo dnf update # sys update
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm # rpm free
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm # rpm nonfree
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo # flatpak

# codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia


# install packages.list
sudo dnf install -y $(grep -v '^#.*' packages.list)

# symlink dotfiles
stow cfg

# git config

if [ ! -f ~/.ssh/githubkey ] ; then
	ssh-keygen -t ed25519 -C "barbarosayildirim@gmail.com" -f ~/.ssh/githubkey
fi 
