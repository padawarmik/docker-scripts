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
  sudo apt install -y curl zsh git neofetch fzf ca-certificates apt-transport-https
  curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
  curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
  sudo apt-get update
  sudo apt-get install -y kubectl helm
  snap --version
  if [[ $? -ne 0 ]]
  then
    apt install snapd -y
  fi
  sudo snap install k9s
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