#!/bin/sh

install_zsh_plugin() {
  if [[ ! -d $2 ]]; then
    echo "Could not locate $2; attempting to install"
    $3
  else
    echo "$1 installed; skipping installation"
  fi
}

#############
# Oh-My-Zsh #
#############
pkg_name="oh-my-zsh"
folder="$HOME/.oh-my-zsh"
install_cmd() {
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}
install_zsh_plugin $pkg_name $folder install_cmd

##########
# Themes #
##########

# powerlevel10k theme
pkg_name="powerlevel10k"
folder="${ZSH}/custom/themes/powerlevel10k"
install_cmd() {
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH}/custom/themes/powerlevel10k
}
install_zsh_plugin $pkg_name $folder install_cmd

###########
# Plugins #
###########

# zsh-autosuggestions
pkg_name="zsh-autosuggestions"
folder="${ZSH}/custom/plugins/zsh-autosuggestions"
install_cmd() {
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH}/custom/plugins/zsh-autosuggestions
}
install_zsh_plugin $pkg_name $folder install_cmd

# Install zsh-history-substring-search
pkg_name="zsh-history-substring-search"
folder="${ZSH}/custom/plugins/zsh-history-substring-search"
install_cmd() {
  git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH}/custom/plugins/zsh-history-substring-search
}
install_zsh_plugin $pkg_name $folder install_cmd

# Install zsh-syntax-highlighting
pkg_name="zsh-syntax-highlighting"
folder="${ZSH}/custom/plugins/zsh-syntax-highlighting"
install_cmd() {
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH}/custom/plugins/zsh-syntax-highlighting
}
install_zsh_plugin $pkg_name $folder install_cmd

# Install git-flow-completion
pkg_name="git-flow-completion"
folder="$ZSH/custom/plugins/git-flow-completion"
install_cmd() {
  git clone https://github.com/bobthecow/git-flow-completion ${ZSH}/custom/plugins/git-flow-completion
}
install_zsh_plugin $pkg_name $folder install_cmd

### External plugins
# zsh-autopair
pkg_name="zsh-autopair"
folder="$HOME/.zsh-autopair"
install_cmd() {
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
}
install_zsh_plugin $pkg_name $folder install_cmd