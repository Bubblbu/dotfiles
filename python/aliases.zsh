# on .{bash,zsh,wtv}rc
alias poetry_shell='. "$(dirname $(poetry run which python))/activate"'
alias pip='python -m pip'

# Start jupyter lab
alias jl="jupyter-lab"

# aliases and functions for jupyter kernel management
alias jk_list='jupyter kernelspec list'
jk_install() {
    python -m ipykernel install --user --name="$1"
}

jk_remove() {
    jupyter kernelspec remove $1
}
