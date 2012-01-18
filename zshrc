# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/veel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /etc/profile

#PROMPT='%d%>:%{\e[0m%}'
#PROMPT=$'%{\e[0;35m%}%B┌─[%b%{\e[0;34m%}%n%{\e[0m%}@%{\e[0;34m%}%m%{\e[0;35m%}%B]%b%{\e[1;35m%}[%b%{\e[0;34m%}%~%{\e[0;35m%}%B]
#%{\e[0;35m%}%B└─╼%b%{\e[1;30m%}%{\e[0m%} '

#PROMPT=$'%{\e[0;33m%}%B[%b%{\e[0;32m%}%n%{\e[0;33m%}%B][%{\e[0;32m%}%~%{\e[0;33m%}%B]%{\e[0m%} ' 

PROMPT=$'%{\e[0;33m%}%B[%{\e[0;32m%}%~%{\e[0;33m%}%B]%{\e[0m%} ' 

alias mel="emacsclient -c --eval '(wl)'"
alias c='cdls.sh'
alias I='sudo pacman -S'
alias ee='emacsclient -c'
alias e='emacs -nw -q -l ~/.emacs-simple.el'
alias mvt='mv ~/dl/*.torrent ~/torrents/active'
alias m="mplayer"
alias df="df -h"
alias shutup="sudo shutdown -h now"
alias feh="feh -."
alias du="du -h"
alias -s {mpg,mpeg,avi,ogm,wmv,m4v,mp4,mov,mkv}='mplayer'
alias -s {png,jpg,jpeg,gif}='feh'
alias -s {html,php,com,net}='conkeror'
alias -s {pdf}='xpdf'
alias scrot="scrot -c -d 5"
alias ls="ls --color -F"
alias ll="ls --color -lh"
alias I="sudo pacman -S"
alias R="sudo pacman -Rs"
alias U="sudo pacman -Syu"
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
alias mmk='make && sudo make clean install'
alias background='feh --bg-scale ~/dl/wallpaper-1065604.jpg'
alias n='ls --color -F'
export AWT_TOOLKIT=MToolkit
export MAIL=/home/veel/.maildir/main/INBOX 

alias skype='xhost +local: && su skypee -c skype'
alias gokgs='javaws http://files.gokgs.com/javaBin/cgoban.jnlp'
alias tv='cd ~/torrents/finished && ls'
alias t='tar xvf'
alias tt='tar xvjf'
alias l='less'
alias mm='mpg123 -C'
export PATH=$PATH:/usr/local/bin:~/code/bin/
alias mtb='sudo mount /dev/sdb1 /mnt/usbstick && cd /mnt/usbstick'
alias mtc='sudo mount /dev/sdc1 /mnt/etwas && cd /mnt/etwas' 
alias umtb='sudo umount /mnt/usbstick'
alias umtc='sudo umount /mnt/etwas'

alias chrom='chromium --incognito --proxy-server=127.0.0.1:8118'
alias vel='change-permissions.sh'
alias mll='offlineimap -q'
alias ptn='python2'
alias fuckingsoundmodule='s modprobe snd_mixer_oss'
alias Iyu='sudo pacman -Syu'
alias Iyy='sudo pacman -Syy'

# edit file with root privs
alias es="SUDO_EDITOR=\"emacsclient -c -a emacs\" sudoedit"   
#bindkey "$(echotc kl)" backward-char
#bindkey "$(echotc kr)" forward-char
#bindkey "$(echotc ku)" up-line-or-history
#bindkey "$(echotc kd)" down-line-or-history
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

export TERM=screen-256color
