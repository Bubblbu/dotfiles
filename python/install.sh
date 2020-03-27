# Pyenv & Pyenv-virtualenv
if test ! $(which pyenv)
then
    # Install pyenv
    curl https://pyenv.run | bash

    # Clone pyenv-virtualenv into pyenvs plugins
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

# install poetry
if test ! $(which poetry)
then
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
fi

# install pipx installed
if test ! $(which pipx)
then
  if test $(which python)
  then
    python -m pip install --user pipx
    python -m pipx ensurepath
  fi
fi

# install several python dev packages globally
if test ! $(which black)
then
    pipx install black
fi

if test ! $(which cookiecutter)
then
    pipx install cookiecutter
fi

if test ! $(which jupyterlab)
then
    pipx install jupyterlab
fi

if test ! $(which tqdm)
then
    pipx install tqdm
fi
