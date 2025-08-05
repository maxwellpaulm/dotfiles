# if status is-interactive
# and not set -q ZELLIJ
#     exec zellij attach --create default
# end
#
# if on a mac, set the shellenv for homebrew
if test (uname) = "Linux"
    echo "Loading Fish for Linux"
else
    echo "Loading Fish for MacOS"
    if ! command -v brew &> /dev/null then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end
end
### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "nvim"                                 # $EDITOR use Emacs in terminal
set VISUAL "nvim"                                 # $VISUAL use Emacs in GUI mode

set -x MANPAGER "nvim -c 'set ft=man' -"

function fish_user_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### ALIASES ###

# vim
alias n='nvim'
#alias vim='nvim'

# Changing "ls" to "exa"
alias ls='lsd -al --color=always' # my preferred listing
#alias la='lsd -a --color=always --group-directories-first'  # all files and dirs
#alias ll='lsd -l --color=always --group-directories-first'  # long format
#alias lt='lsd -aT --color=always --group-directories-first' # tree listing
#alias l.='lsd -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# navigation shortcuts
alias ndev="cd $HOME/dev"
alias nconfig="cd $HOME/.config"
