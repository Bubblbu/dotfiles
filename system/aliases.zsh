# General aliases
alias ls="lsd"
alias cds="cd ~/Projects/scholcommlab"
alias cdp="cd ~/Projects"
alias cdd="cd ~/Downloads"
alias cddb="cd ~/Documents/Dropbox"

# Monitor shortcuts
alias sme="sh -c 'xrandr --output HDMI2 --auto --output eDP1 --mode 1920x1080 --rate 60.02 --left-of HDMI2'"
alias smd="sh -c 'xrandr --output HDMI2 --mode 1920x1080 --rate 60.00 --output eDP1 --mode 1920x1080 --rate 60.02 --same-as HDMI2'"
alias smr="sh -c 'xrandr --output HDMI2 --off --output eDP1 --mode 1920x1080 --rate 60.02 --same-as HDMI2'"

# Utiities
alias restart_wifi="sudo service network-manager restart"
alias aptdate="sudo apt update && sudo apt upgrade"

alias dotfiles_edit="e /home/asura/.dotfiles/"
alias dotfiles_bootstrap="/home/asura/.dotfiles/script/bootstrap"