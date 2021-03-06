#######################
#### function defs
#######################

# function to go to the directory of the topmost open
# finder folder
# from http://www.macosxhints.com/article.php?story=20060719155640762
ff() {
    osascript -e 'tell application "Finder"'\
      -e "if (${1-1} <= (count Finder windows)) then"\
      -e "get POSIX path of (target of window ${1-1} as alias)"\
      -e 'else' -e 'get POSIX path of (desktop as alias)'\
      -e 'end if' -e 'end tell';
}

cdff() { cd "$(ff $@)"; };

finder-update-window() {
    osascript -e 'tell application "Finder"'\
      -e 'tell front window'\
      -e 'update every item with necessity'\
      -e 'end tell' -e 'end tell';
}

finder-update-desktop() {
    osascript -e 'tell application "Finder"'\
      -e 'update desktop' -e 'end tell';
}


#######################
#### export vars
#######################

export COPYFILE_DISABLE='true'
export LSCOLORS='gxfxcxdxbxegedabagacad'

## bash_completion if installed, and not already loaded ##
if [ -n "$BASH" ] && [ -z "${BASH_COMPLETION}" ] &&
        [ -f $HOME/.brew/share/bash-completion/bash_completion ]; then
     export BASH_COMPLETION_COMPAT_DIR=$HOME/.brew/etc/bash_completion.d/
     . $HOME/.brew/share/bash-completion/bash_completion
fi;

## lesspipe if installed ##
LESSPIPEX="$(type -p lesspipe.sh)"
[ -x "${LESSPIPEX}" ] && export LESSOPEN="|${LESSPIPEX} %s"

# disable save/restore shell state support in macos (see /etc/bashrc_Apple_Terminal)
export SHELL_SESSION_HISTORY=0

##########################
#### aliases
##########################

alias locate='mdfind -name'
alias ls='ls -p'
