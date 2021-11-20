#/bin/bash

# Set the ZSH env if it's not already set
if [ -z ${ZSH} ]; then
    export ZSH="${XDG_CONFIG_HOME:-$HOME/.local/share}/oh_my_zsh"
fi

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Remove .zshrc if existent
[ -f "$HOME/.zshrc" ] && rm $HOME/.zshrc

# Install required plugins (syntax highlighting)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH:-$HOME/.local/share/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "${XDG_DATA_HOME:-$HOME/.local/share}/tmux/tpm"

# nvchad init
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
