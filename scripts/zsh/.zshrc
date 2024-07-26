PZSHVER="1.1"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
zplug "joshskidmore/zsh-fzf-history-search", defer:2
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases/custom_aliases
source $HOME/.aliases/customs
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
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
