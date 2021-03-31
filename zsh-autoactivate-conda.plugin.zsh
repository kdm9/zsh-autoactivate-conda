autoload -U add-zsh-hook
zsh_autoactivate_conda() {
    if [[ -f environment.yml && -r environment.yml && -n "$(which conda 2>/dev/null)" ]];
    then
        env=$(python3 -c 'import yaml; print(yaml.load(open("environment.yml"))["name"])' 2>/dev/null)
        if [ -n "$env" ]
        then
            conda activate "$env" 2>/dev/null
        fi
    fi
}
add-zsh-hook chpwd zsh_autoactivate_conda

