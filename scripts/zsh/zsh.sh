printf "\n\n"
printf "_______________________________________________________________________________"
printf "\n\nYou are going to install zsh with some plugins.\nYou have 10 seconds to cancel this action\n"
printf "_______________________________________________________________________________"
printf "\n\n"
sleep 10
printf "Update of apt\n"
apt update
printf "ZSH and oh-my-zsh\n"
apt install -y curl zsh git
curl https://raw.githubusercontent.com/padawarmik/docker-scripts/main/scripts/zsh/.p10k.zsh -o ~/.p10k.zsh -s
curl https://raw.githubusercontent.com/padawarmik/docker-scripts/zplug/scripts/zsh/.zshrc -o ~/.zshrc -s
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# printf "Now I am going to clone requested plugins\n"
# sleep 1
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# printf "Changing of ~/.zshrc to apply changes\n"
# sed -i "/ZSH_THEME=/c\ZSH_THEME=\"powerlevel10k/powerlevel10k\"" ~/.zshrc
# sed -i "/plugins=/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" ~/.zshrc
# grep -q ZSH_AUTOSUGGEST_STRATEGY ~/.zshrc
# if [ $? -eq 1 ]
# then
#     echo "ZSH_AUTOSUGGEST_STRATEGY=" >> ~/.zshrc
# fi
# sed -i "/ZSH_AUTOSUGGEST_STRATEGY=/c\ZSH_AUTOSUGGEST_STRATEGY=(history completion)" ~/.zshrc
chsh -s $(which zsh)
if [ $SHELL == "/usr/bin/zsh" ]
then
    omz reload 
fi
grep -q "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" ~/.zshrc
if [ $? -eq 1 ]
then
    echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc
fi
printf "\n\n"
printf "The work has been done, restart your terminal now to feel the power of the ZSH command prompt\n"
