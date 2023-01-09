
# constants
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
USER_CONFIG_DIR=$HOME/.config

# functions
link_config () {
    echo ""
    PROG_CONFIG_DIR=$USER_CONFIG_DIR/$1
    rm --recursive $PROG_CONFIG_DIR
    ln --verbose --symbolic $SCRIPT_DIR/configs/$1 $PROG_CONFIG_DIR
    echo "Linked $1 config"
}

# this is used for other local files which don't need to be captured in dotfiles
mkdir $HOME/.config/local
touch $HOME/.config/local/fish.config

link_config "alacritty"
link_config "awesome"
link_config "doom"
link_config "fish"
link_config "i3"
link_config "lvim"
link_config "qutebrowser"
link_config "xmobar"
link_config "xmonad"
