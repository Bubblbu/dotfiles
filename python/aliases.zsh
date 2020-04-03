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

# Strip jupyter notebooks
alias nbstrip_jq="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
    | .cells[].metadata = {} \
    '"

