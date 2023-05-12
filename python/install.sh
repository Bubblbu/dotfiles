#!/bin/sh

install_package() {
    if ! command -v $1 &> /dev/null; then
        echo "Could not find $1; attempting to install"
        $2
    else
        echo "$1 installed; skipping installation"
    fi
}

### Packages ###
# Install pyenv
install_cmd () {
    # install pyenv
    curl https://pyenv.run | bash

    # config and setup pyenv
    [[ -z "$PYENV_ROOT" ]] && export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    pyenv init --path
    pyenv init - --no-rehash zsh
    pyenv virtualenv-init -

    # install specified python version
    pyenv install $PY_VERSION
    pyenv global $PY_VERSION
}
install_package "pyenv" install_cmd

# install pipx
pkg_name="pipx"
install_cmd() { 
    python -m pip install --user pipx
    python -m pipx ensurepath
}
install_package "$pkg_name" install_cmd

# install poetry
pkg_name="poetry"
install_cmd() { 
    pipx install poetry
}
install_package "$pkg_name" install_cmd

# install jupyter
pkg_name="jupyter"
install_cmd() { 
    pipx install jupyter --include-deps
    pipx inject jupyter jupyterlab
}
install_package "$pkg_name" install_cmd

# install black
pkg_name="black"
install_cmd() { 
    pipx install black
}
install_package "$pkg_name" install_cmd

# install cookiecutter
pkg_name="cookiecutter"
install_cmd() { 
    pipx install cookiecutter
}
install_package "$pkg_name" install_cmd

# install tqdm
pkg_name="tqdm"
install_cmd() { 
    pipx install tqdm
}
install_package "$pkg_name" install_cmd