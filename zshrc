# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/veel/.zshrc'

setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -e

autoload -U promptinit
promptinit
autoload -U colors && colors
#PROMPT="[%{$fg[green]%}%~%{$reset_color%}]"

#PROMPT="%~"
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
source /etc/profile
PS1="%B%{%F{green}%}[%{%F{yellow}%}%~%{%F{green}%}] %{%f%}%]%b"

alias ee='emacsclient -c'
alias m="mplayer"
alias feh="feh -."
alias du="du -h"
alias -s {mpg,mpeg,avi,ogm,wmv,m4v,mp4,mov,mkv}='mplayer'
alias -s {png,jpg,jpeg,gif}='feh'
alias -s {html,php,com,net}='conkeror'
alias -s {pdf}='xpdf'
alias scrot="scrot -c -d 5"
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias svi='sudo vi'
alias scp='sudo cp'
alias smv='sudo mv'
alias srm='sudo rm'
alias s='sudo'
alias reboot='sudo reboot'
alias xxx='startx'
alias x='xpdf -fg yellow -bg black'
alias wt='weather.sh'
alias mtusb='s mount /dev/sdb1 /mnt/usbstick'
alias background='feh --bg-scale ~/dl/wallpaper-1065604.jpg'
alias n='ls --color -F'

alias gokgs='javaws http://files.gokgs.com/javaBin/cgoban.jnlp'
alias t='tar xvf'
alias tt='tar xvjf'
alias l='less'
alias mm='mpg123 -C'

# edit file with root privs
alias es="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"   
#bindkey "$(echotc kl)" backward-char
#bindkey "$(echotc kr)" forward-char
#bindkey "$(echotc ku)" up-line-or-history
#bindkey "$(echotc kd)" down-line-or-history
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

export TERM=screen-256color

export PATH=/home/veel/code/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
alias df='df -h'
alias shutup='systemctl poweroff'
alias susp='systemctl suspend'
alias testping='ping -c3 www.startpage.com'
alias sy='sudo yum'
alias mmk='make && sudo make clean install'
alias hhtop='uxterm -e htop'
alias sapi='sudo apt-get install'

export EDITOR='emacsclient -c'
export KEYMAP='col'
alias reboot="sudo reboot"
