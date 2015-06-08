
    # ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       rar x $1       ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
    }

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    export PS1="\[$(tput bold)\]\[$(tput setaf 5)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 5)\]\w\[$(tput setaf 2)\][\[$(tput setaf 6)\]\t\[$(tput setaf 2)\]]\\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"
else
    export PS1="\[$(tput bold)\]\[$(tput setaf 5)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 5)\]\w\[$(tput setaf 2)\][\[$(tput setaf 6)\]\t\[$(tput setaf 2)\]]\\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        export PS1="\[$(tput bold)\]\[$(tput setaf 5)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 5)\]\w\[$(tput setaf 2)\][\[$(tput setaf 6)\]\t\[$(tput setaf 2)\]]\\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    ## Show hidden files ##
    alias l.='ls -d .* --color=auto'
    alias c='clear'
    ## get rid of command not found ##
    alias cd..='cd ..'
fi


# some more ls aliases
alias lss='clear;ls -l'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export TERM=xterm-256color

# LB - DOOP related environment
export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
export DOOP_HOME=/home/anantoni/doop-nexgen/
export DOOP_PROJECT=doop-nexgen

source ~/lb-engines/logicblox-3.10.24/etc/profile.d/logicblox.sh
alias home='cd ${HOME}'
alias doop_home="cd ${HOME}/doop-nexgen"

#JAVA_HOME=${HOME}/Dropbox/resources/java/jdk1.8.0_20/
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
PATH=${JAVA_HOME}/bin/:${PATH}
GRADLE_HOME=/opt/gradle-2.4
MAVEN_HOME=/opt/apache-maven-3.3.3
PATH=${PATH}:${DOOP_HOME}
PATH=${PATH}:${MAVEN_HOME}/bin/
PATH=${PATH}:${GRADLE_HOME}/bin/
export JAVA_HOME
#export JRE_HOME
export PATH

# some more ls aliases
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CFlh'
alias woo='fortune'
alias lsd="ls -alF | grep /$"

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"


# Show me the size (sorted) of only the folders in this directory
alias dirs="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# This will keep you sane when you're about to smash the keyboard again.
alias frak="fortune"

# This is where you put your hand rolled scripts (remember to chmod them)
PATH="$HOME/bin:$PATH"

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias emacsd='emacs --daemon'
alias emacs='emacs -nw'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias vim='emacsclient -t'
alias vi='emacsclient -t'
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias bc='bc -l'
alias sha1='openssl sha1'
alias mkdir='mkdir -pv'
alias diff='colordiff'
alias mount='mount |column -t'

# handy short cuts #
alias h='history'
alias j='jobs -l'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

alias ports='netstat -tulanp'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# distro specific  - Debian / Ubuntu and friends #
# install with apt-get
alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"
 
# update on one command
alias update='sudo apt-get update' 
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
 
# soot
alias soot='java -cp /home/anantoni/soot/sootclasses-2.5.0.jar:/home/anantoni/soot/jasminclasses-2.5.0.jar:/home/anantoni/soot/polyglotclasses-1.3.5.jar soot.Main -cp .:/opt/java/jdk1.7.0_55/jre/lib/rt.jar'


if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
fi

#colors
force_color_prompt=yes
