
# constants
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
USER_CONFIG_DIR=$HOME/.config

# functions
link_config () {
    echo ""
    PROG_CONFIG_DIR=$USER_CONFIG_DIR/$1
    rm -r $PROG_CONFIG_DIR
    ln -v -s $SCRIPT_DIR/configs/$1 $PROG_CONFIG_DIR
    echo "Linked $1 config"
}


if [ ! -z "$1" ]
then
    link_config "$1"
    exit 1
fi


# this is used for other local files which don't need to be captured in dotfiles
# for example, included below is a fish.config file which is not tracked by git
# but may contain OS specific shortcuts
mkdir $HOME/.config/local
touch $HOME/.config/local/fish.config

link_config "alacritty"
link_config "fish"
link_config "tmux"
link_config "vim"
link_config "nvim-config"

