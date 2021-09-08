# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# themes
# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH}/custom/themes/powerlevel10k

# plugins
# Install zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH}/custom/plugins/zsh-completions

# install autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH}/custom/plugins/zsh-autosuggestions

# Install zsh-vi-mode
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH}/custom/plugins/zsh-vi-mode