export ZSH="$HOME/.oh-my-zsh"

if [ -f ${HOME}/.zplug/init.zsh ]; then
    source ${HOME}/.zplug/init.zsh
fi
#cp - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/cp/README.md
#docker-compose - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/docker-compose/README.md
plugins=(git docker-compose cp kubectl helm zsh-interactive-cd)
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-completions", defer:2
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases/custom_aliases
source $HOME/.aliases/customs
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
alias zsh-rerun="curl -s https://raw.githubusercontent.com/padawarmik/docker-scripts/main/scripts/zsh/zsh.sh > zsh.sh ;  bash zsh.sh ; rm zsh.sh"
zplug load
# clear
neofetch
