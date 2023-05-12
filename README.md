# bubblbu does dotfiles

My dotfiles managed using [@holman's approach](https://github.com/holman/dotfiles) with some extra fun added to support configuration files in `$XDG_CONFIG_HOME` and automatic symlinking for snaps.

**usage**

`dot` provides a few wrappers to access the essential functions required to manage your dotfiles. 

```shell
  dot -- dotfiles management

  Usage: dot [options]

  Options:
    -e, --edit            Open dotfiles directory for editing
    -b, --bootstrap       Bootstrap all dotfiles
    -i, --install         Run install scripts
    -h, --help            Show this help message and exit
```

## install

Clone this repository into your home directory and run the following scripts:

```
git clone https://github.com/bubblbu/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
source bootstrap
```

This will symlink all .dotfiles from the individual folders in ~/.dotfiles to their respective locations:

- `topic/filename.symlink` files will be symlinked to `~/.filename`
- `topic/filename.ending.xdg` files will be symlinked to `~/.config/topic/filename.ending`

Furthermore, `source install` will run a few useful installers specified in `topic/install.sh`

## how it works

Basic usage is the same as described by Holman's dotfiles:

```
bin/: Anything in bin/ will get added to your $PATH and be made available everywhere.
topic/*.zsh: Any files ending in .zsh get loaded into your environment.
topic/path.zsh: Any file named path.zsh is loaded first and is expected to setup `$PATH` or similar.
topic/completion.zsh: Any file named completion.zsh is loaded last and is expected to setup autocomplete.
topic/install.sh: Any file named install.sh is executed when you run `install`. To avoid being loaded automatically, its extension is .sh, not .zsh.
topic/*.symlink: Any file ending in *.symlink gets symlinked into your `$HOME`. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `bootstrap`.
```

However, I've also added support for **config files that are placed in `$XDG_CONFIG_HOME`** (usually ~/.config/appname/config.file) and automatic symlinking of `.desktop` files of apps that were installed with snap which are otherwise not found by default with zsh. 

```
app/*.xdg: Any file ending in *.xdg gets symlinked into your `$XDG_CONFIG_HOME`. The folder name is not optional in this case as the configuration files are placed accordingly.
```

## the dotfiles

This is an overview of all included dotfiles which I need as I simply keep forgetting about them... 

### General

- System: Contains global aliases, some paths & envs, and SSH stuff
- bin: Contains functions that are made available globally
- functions: `functions`

### ZSH & oh-my-zsh

Requirements: oh-my-zsh, powerlevel10k, lsd

- ZSH: `zshrc.symlink`

### Coding

- Git: `aliases.zsh`, `git-flow-completion.zsh`, and a few global git config files
- Vim: `vimrc.symlink`
- Direnv: `direnv/direnvrc.xdg`
- Other: `node/path.zsh`, `ruby/path.zsh`, `texlive/path.zsh`

### Python, Jupyter

Requirements: pyenv, poetry, pipx, and a few packages that I always need (black, cookiecutter, jupter-lab, tqdm)

- Python: `aliases.zsh`, `python/path.zsh`, `python/install.sh`
- Jupyter: `jupyter_notebook_config.py.xdg`