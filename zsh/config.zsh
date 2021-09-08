# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
    colored-man-pages
    git
    ssh-agent
    z
    zsh-vi-mode
    zsh-completions
    zsh-autosuggestions
)

# Plugins config
### Use ksshaskpass to manage the SSH key with the system wallet
zstyle :omz:plugins:ssh-agent helper ksshaskpass

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Other ZSH configuration
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_HIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS