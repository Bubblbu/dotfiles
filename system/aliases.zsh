# ZSH
alias reload!='. ~/.zshrc'

# use lsd instead of ls
alias ls="lsd"

# Utiities
alias aptdate="sudo apt update && sudo apt upgrade -y"
alias restart_wifi="sudo service network-manager restart"
alias restart_audo="pulseaudio -k && sudo alsa force-reload"

# Clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Monitor shortcuts
alias smd="sh -c 'xrandr --output HDMI2 --auto --output eDP1 --auto --same-as HDMI2'"
alias smr="sh -c 'xrandr --output HDMI2 --off --output eDP1 --auto --same-as HDMI2'"
alias smright="sh -c 'xrandr --output HDMI2 --auto --output eDP1 --auto --left-of HDMI2'"
alias smleft="sh -c 'xrandr --output HDMI2 --auto --output eDP1 --auto --right-of HDMI2'"
alias smbelow="sh -c 'xrandr --output HDMI2 --auto --output eDP1 --auto --above HDMI2'"
alias smtop="sh -c 'xrandr --output HDMI2 --auto --output eDP1 --auto --below HDMI2'"

# Navigation
alias cds="cd ~/Projects/scholcommlab"
alias cdp="cd ~/Projects"
alias cdd="cd ~/Downloads"
alias cddb="cd ~/Documents/Dropbox"

alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'

# renaming tools
alias zcp='zmv -C' zln='zmv -L'
