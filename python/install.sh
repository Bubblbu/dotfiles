# Pyenv & Pyenv-virtualenv
if ! function_exists pyenv
then
    # Install pyenv
    curl https://pyenv.run | bash

    # Clone pyenv-virtualenv into pyenvs plugins
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

# install poetry
if ! function_exists poetry
then
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
fi

# install pipx installed
if ! function_exists pipx
then
  if function_exists python
  then
    python -m pip install --user pipx
    python -m pipx ensurepath
  fi
fi

# install several python dev packages globally
if ! function_exists black
then
    pipx install black
fi

if ! function_exists cookiecutter
then
    pipx install cookiecutter
fi

if ! function_exists jupyter-lab
then
    pipx install jupyterlab
fi

if ! function_exists tqdm
then
    pipx install tqdm
fi
