#!/bin/bash

install_zplug () {
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

sleep 1
printf "\n\n"
printf "_______________________________________________________________________________"
printf "\n\nYou are going to install zsh with some plugins.\nYou have 10 seconds to cancel this action\n"
printf "_______________________________________________________________________________"
printf "\n\n"
sleep 10
printf "Update of apt\n"
apt update
printf "ZSH and oh-my-zsh\n"
apt install -y curl zsh git neofetch
curl https://raw.githubusercontent.com/padawarmik/docker-scripts/main/scripts/zsh/.p10k.zsh -o ~/.p10k.zsh -s

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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
        rm ~/.zshrc -f
        curl https://raw.githubusercontent.com/padawarmik/docker-scripts/main/scripts/zsh/.zshrc -o ~/.zshrc -s
    fi
fi
printf "\n\n"
printf "The work has been done, restart your terminal now to feel the power of the ZSH command prompt\nNow you can run chsh -s '$(which zsh)' to set default shell"
