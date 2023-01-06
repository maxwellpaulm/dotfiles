INCLUDE_ALACRITTY=true


# alacritty
if ["$INCLUDE_ALACRITTY" = true]; then
    ALACRITTY_DIR=$HOME/.configs/alacritty
    rm -r $ALACRITTY_DIR
    ln -s ./configs/alacritty $ALACRITTY_DIR
fi