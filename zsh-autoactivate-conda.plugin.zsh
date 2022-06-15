autoload -U add-zsh-hook
ZSH_AUTOACTIVATE_CONDA_BINNAME="${ZSH_AUTOACTIVATE_CONDA_BINNAME:-conda}"
zsh_autoactivate_conda() {
    if [[ -f environment.yml && -r environment.yml && -n "$(which "${ZSH_AUTOACTIVATE_CONDA_BINNAME}" 2>/dev/null)" ]];
    then
        env=$(python3 -c 'import yaml; print(yaml.safe_load(open("environment.yml"))["name"])' 2>/dev/null)
        if [ -n "$env" ]
        then
            "${ZSH_AUTOACTIVATE_CONDA_BINNAME}" activate "$env" 2>/dev/null
        fi
    fi
}
add-zsh-hook chpwd zsh_autoactivate_conda

