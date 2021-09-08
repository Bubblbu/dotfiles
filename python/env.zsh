# Global PyEnv Version
export PY_VERSION="3.8.12"

# PyEnv
[[ -z "$PYENV_ROOT" ]] && export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(pyenv init - --no-rehash zsh)"
eval "$(pyenv virtualenv-init -)"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"