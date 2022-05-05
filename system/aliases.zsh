# ZSH
alias reload!='. ~/.zshrc'

# use lsd instead of ls
alias ls='lsd'

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# Navigation
alias cdp="cd "$PROJECTS""
alias cddot="cd "$ZSHDOT""
alias cdd="cd ~/Downloads"
alias cddb="cd ~/Dropbox/"

alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'

# Clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# renaming tools
alias zcp='zmv -C'
alias zln='zmv -L'
