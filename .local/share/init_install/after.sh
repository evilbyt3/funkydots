#/bin/bash

putgitbarerepo() { # Initialize git bare repo for dotfiles
  git clone --bare "$1" $HOME/.dtf
  function config {
     /usr/bin/git --git-dir=$HOME/.dtf/ --work-tree=$HOME $@
  }
  mkdir -p .config-backup
  config checkout
  if [ $? = 0 ]; then
    echo "Checked out config.";
    else
      echo "Backing up pre-existing dot files.";
      mkdir $HOME/.config-backup && \
        config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/
  fi;
  config checkout
  config config status.showUntrackedFiles no
}

dotfilesrepo="$1"
[ -z "$dotfilesrepo" ] && dotfilesrepo="https://github.com/evilbyt3/funkydots"

# Add .Xresources if doesn't exist
touch "$HOME/.Xresources"

# chadwm build
cd "$HOME/.config/chadwm/chadwm/" && sudo make clean && sudo make install && cd "$HOME"

# Setup catpuccin rofi
mkdir -p "$HOME/.config/rofi" && git clone https://github.com/catppuccin/rofi /tmp/rofi && cp -r /tmp/rofi/deathemonic/* "$HOME/.config/rofi" && rm -r /tmp/rofi
# TODO: change font with sed to ProggyClean Nerd Font

# Set the ZSH env if it's not already set
if [ -z ${ZSH} ]; then
    export ZSH="${XDG_CONFIG_HOME:-$HOME/.local/share}/oh_my_zsh"
fi

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Remove .zshrc if existent
[ -f "$HOME/.zshrc" ] && rm $HOME/.zshrc

# Setup bare repo
putgitbarerepo "$dotfilesrepo"

# Install required plugins (syntax highlighting)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH:-$HOME/.local/share/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "${XDG_DATA_HOME:-$HOME/.local/share}/tmux/tpm"


# nvchad init
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

# Install rustup 4 eww
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#rustup install nightly

# eww
# git clone https://github.com/elkowar/eww && cd eww && cargo build --release && cp target/releases/eww ~/.local/bin/system/

# Cleanup
[ -f "$HOME/larbs.sh" ] && rm $HOME/larbs.sh
fc-cache -fv
