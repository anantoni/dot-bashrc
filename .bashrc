export JAVA_HOME=/opt/java/jdk1.7.0_55
export PATH=$PATH:$JAVA_HOME/bin/
export PATH=$PATH:/home/anantoni/doop
export LOGICBLOX_HOME=/home/anantoni/lb_engines/LogicBlox-3.9.0
export DOOP_HOME=/home/anantoni/doop/

alias bloxbatch=$LOGICBLOX_HOME/bin/bloxbatch 
alias home='cd /home/anantoni'
alias doop_home="cd /home/anantoni/doop"
## Show hidden files ##
alias l.='ls -d .* --color=auto'
alias lss='clear;ls -l'
alias c='clear'
## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

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
