#!/bin/bash

install_zplug () {
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

sleep 1
printf "\n\n"
printf "_______________________________________________________________________________"
printf "\n\nYou are going to install zsh with some plugins.\n"
printf "_______________________________________________________________________________"
printf "\n\n"

read -p "Do you want to install additionall software reccomended?[Yy/Nn] " -n 1 -r
printf "\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
  printf "Update of apt\n"
  sudo apt update
  printf "ZSH and oh-my-zsh\n"
  sudo apt install -y curl zsh git neofetch fzf
fi
curl https://raw.githubusercontent.com/padawarmik/docker-scripts/main/scripts/zsh/.p10k.zsh -o $HOME/.p10k.zsh -s

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
if [ ! -d "$HOME/.zplug" ]; then
  install_zplug
fi

if [ -f $HOME/.zshrc ]
then
  read -p "Your .zshrc file will be replaced. Do you want to continue?[Yy/Nn] " -n 1 -r
  printf "\n"
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    printf "Deleting\n"
    rm $HOME/.zshrc -f
    curl https://raw.githubusercontent.com/padawarmik/docker-scripts/main/scripts/zsh/.zshrc -o $HOME/.zshrc -s
  fi
fi

mkdir -p $HOME/.aliases
touch $HOME/.aliases/custom_aliases
touch $HOME/.aliases/customs
printf "\n\n"
printf "The work has been done, restart your terminal now to feel the power of the ZSH command prompt\nNow you can run chsh -s '$(which zsh)' to set default shell.\n"
printf "You can now add custom aliases to the ~/.aliases/custom_aliases file.\n"
printf "To rerun this script run 'zsh-rerun'\n"