# bubblbu does dotfiles

My dotfiles management system with some extra fun added to support configuration files following the XDG base directory standard.

## install

Clone this repository into your home directory and run the following scripts:

```console
git clone https://github.com/bubblbu/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
source bootstrap
```

This will symlink all .dotfiles from the individual folders in ~/.dotfiles to their respective locations:

- `topic/filename.symlink` files will be symlinked to `~/.filename`
- `topic/filename.ending.xdg` files will be symlinked to `~/.config/topic/filename.ending`

Furthermore, `source install` will run a few useful installers specified in `topic/install.sh`

## usage

`dot` provides a few wrappers to access the essential functions required to manage your dotfiles.

```console
  dot -- dotfiles management

  Usage: dot [options]

  Options:
    -e, --edit            Open dotfiles directory for editing
    -b, --bootstrap       Bootstrap all dotfiles
    -i, --install         Run install scripts
    -h, --help            Show this help message and exit
```

## how it works

Basic usage is the same as described by Holman's dotfiles. However, I've also added support for **config files that are placed in `$XDG_CONFIG_HOME`** (usually ~/.config/appname/config.file).

### general functions

- `bin`: Anything in bin/ will get added to your $PATH and be made available everywhere.
- `functions`: helper functions

### .zsh files

- `topic/*.zsh`: Any files ending in .zsh get loaded into your environment.
- `topic/path.zsh`: Any file named path.zsh is loaded first and is expected to setup `$PATH` or similar.
- `topic/completion.zsh`: Any file named completion.zsh is loaded last and is expected to setup autocomplete.

### dotfiles

- `topic/[[config]].symlink`: Any file ending in \*.symlink gets symlinked into your `~/.config`. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `bootstrap`.
- `topic/[[config.ending]].xdg`: Any file ending in \*.xdg gets symlinked to `~/.config/topic/config.ending`. The folder name is not optional in this case as the configuration files are placed accordingly.

### install scripts

- `topic/install.sh`: Any file named install.sh is executed when you run `install`. To avoid being loaded automatically, its extension is .sh, not .zsh.

## Topics

This is an overview of all included dotfiles which I need as I simply keep forgetting about them...

### ZSH & oh-my-zsh

- zsh
  - alieses, config, fpath that are sourced by ZSH
  - two symlinked dotfiles: `zshrc.symlink`, `p10k.zsh.symlink`
  - install.sh which installs oh-my-zsh, powerlevel10k, and several plugins

### Coding

- python
  - aliasess, env, and path for pyenv & poetry setup
  - install.sh to install pyenv, pipx, poetry, and other tools
- jupyter
  - env variables to set the jupyter config dir
  - two symlinked dotfiles: `jupyter_notebook_config.py.xdg`, `jupyter_lab_config.py.xdg`
- git
  - `aliases.zsh` to add a few git aliases
  - gitconfig.local.example which is used to create the .symlink version during bootstrap
  - three symlinked dotfiles: .gitconfig.local, .gitconfig, .gitignore
- vim
  - symlinked dotfile: `vimrc.symlink`
- direnv
  - symlinked fotfile: `direnv/direnvrc.xdg`

### Other

- flatpak: just contains aliases for installed apps
- node: NVM and NPM setup
- ruby: setup folder for ruby gems
- texlive: add texlive to PATH
