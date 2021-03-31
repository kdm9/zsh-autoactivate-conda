autoload -U add-zsh-hook
condadir() {
    if [[ -f environment.yml && -r environment.yml && -n "$(which conda 2>/dev/null)" ]];
    then
        echo "in autoconda"
        env=$(python3 -c 'import yaml; print(yaml.load(open("environment.yml"))["name"])' 2>/dev/null)
        if [ -n "$env" ]
        then
            echo conda activate "$env"
            conda activate "$env" 2>/dev/null
        fi
    fi
}
add-zsh-hook chpwd condadir

