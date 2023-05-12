###############
# ZSH Options #
###############

# https://zsh.sourceforge.io/Doc/Release/Options.html
# Functions, tasks
setopt NO_BG_NICE # Nice bg tasks are run on lower priority.
setopt NO_HUP # Don't kill processes that have been spawned by terminal when closed
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

# History
# Additional history stuff is configured by OhMyZsh
setopt NO_HIST_BEEP # Turn off beep when non-existing history element is accessed

# Input
setopt PROMPT_SUBST # Additional subsitutions
setopt CORRECT # Try to correct the spelling of commands

##############
# Plugins    #
##############

# Init autopair
source ~/.zsh-autopair/autopair.zsh
autopair-init

# Improve git autocomplete performace
__git_files () { 
    _wanted files expl 'local files' _files     
}

########################
# Misc system settings #
########################

# Turn off BIOS sounds
xset -b