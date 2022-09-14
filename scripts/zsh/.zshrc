export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
if [ -f ${HOME}/.zplug/init.zsh ]; then
    source ${HOME}/.zplug/init.zsh
fi
#cp - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/cp/README.md
#docker-compose - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/docker-compose/README.md
plugins=(git, docker-compose, cp)
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-completions", defer:2
source $ZSH/oh-my-zsh.sh


ZSH_AUTOSUGGEST_STRATEGY=(history completion)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
