#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Print color bar
########################################################################################
colorbar () {
	echo;for i in {1..7};do printf "$(tput setab $i)  "$(tput sgr0);done;echo;echo;
}
colorbar

# Set PATH
########################################################################################
set GET=~/Projects/get/get.sh
export SCRIPTS=~/.scripts
export PATH=$PATH:$SCRIPTS:$GET

PS1='\[$(tput setaf 5)\]\w \[$(tput setaf 4)\]>> \[$(tput sgr0)\]'

# Environment Variables
########################################################################################
export RANGER_LOAD_DEFAULT_RC=~/.config/ranger/rc.conf
export READER="zathura"
export BROWSER="firefox"
export PAGER="less"
export TMPDIR=~/.tmp

# Aliases
########################################################################################
alias clear='clear; colorbar'
alias c='clear'
alias ls='ls --color=auto'
alias ll='ls -ACghp --group-directories-first'
alias grep='grep --color=auto'

alias conf='cd ~/.config'
alias docs='cd ~/Documents'
alias down='cd ~/Downloads'
alias pics='cd ~/Pictures'
alias proj='cd ~/Projects'
alias scrp='cd ~/.scripts'
alias school='cd ~/School/2020_Spring'
alias porn='ranger ~/Video/porn/'

alias vimbash='vim ~/.bashrc'
alias config='/usr/bin/git --git-dir=$HOME/.config-git/ --work-tree=$HOME'
