export PATH="./bin:/usr/local/bin:/usr/local/sbin:$ZSHDOT/bin:$ZSHDOT/functions:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# setup for correctly for snaps
export PATH="/snap/bin:$PATH"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/snapd/desktop/"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"