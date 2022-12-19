
# a script to save my configs to the dotfiles locations

## OPTIONS ##
SAVE_DOOM=true

## LOCATIONS ##
DOTFILES=$HOME/dev/dotfiles
DOOM_EMACS=$HOME/.emacds.d/

# perform the copies...
if [ $SAVE_DOOM -e ]; then
    cp -r $DOTFILES
fi;
