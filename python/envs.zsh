# Setup poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Setup pyenv / & pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/home/asura/.pyenv/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

eval "$(pyenv virtualenv-init -)"