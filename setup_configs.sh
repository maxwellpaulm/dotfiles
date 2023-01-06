
# constants
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
USER_CONFIG_DIR=$HOME/.config

# functions
link_config () {
    echo ""
    if ! command -v $1 &> /dev/null; then
        echo "Could not find $1, ignoring"
    else
        PROG_CONFIG_DIR=$USER_CONFIG_DIR/$1
        rm --verbose --recursive $PROG_CONFIG_DIR
        ln --verbose --symbolic $PROG_CONFIG_DIR/configs/$1 $PROG_CONFIG_DIR
        echo "Linked $1 config"
    fi
}

# this is used for other local files which don't need to be captured in dotfiles
mkdir $HOME/.config/local
touch $HOME/.config/local/fish.config

link_config "alacritty"
link_config "doom"
link_config "fish"
link_config "nvim"
