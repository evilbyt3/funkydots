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

# Install rustup 4 eww
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# rustup install nightly

# eww
# git clone https://github.com/elkowar/eww && cd eww && cargo build --release && cp target/releases/eww ~/.local/bin/system/

# Cleanup
[ -f "$HOME/larbs.sh" ] && rm $HOME/larbs.sh
