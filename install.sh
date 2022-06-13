sudo eopkg up # update cak
sudo eopkg it -c system.devel # bunlar elzem

# install packages.list
sudo eopkg it -y $(grep -v '^#.*' packages.list)

# symlink dotfiles
stow cfg

# git config

if [ ! -f ~/.ssh/githubkey ] ; then
	ssh-keygen -t ed25519 -C "barbarosayildirim@gmail.com" -f ~/.ssh/githubkey
fi 
