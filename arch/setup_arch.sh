sudo pacman -Syu
sudo pacman -S - < pkglist.txt

# Install repos with configs in them, the symlink configs
DEV_DIR=$HOME/dev
git clone git@github.com:maxwellpaulm/dotfiles.git $DEV_DIR
git clone git@github.com:maxwellpaulm/nvim-config.git $DEV_DIR
$HOME/dev/dotfiles/install.sh
$HOME/dev/nvim-config/install.sh

