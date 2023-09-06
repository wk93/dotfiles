# My dotfiles

My configuration includes:
* Terminal emulator - [Alacritty](https://alacritty.org/)
* Shell - [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
* Package Manager - [Brew](https://brew.sh/)

## Installation
```sh
# xcode tools like git 
xcode-select --install

# clone repo and create symlinks
git clone git@github.com:wk93/dotfiles.git ~/.dotfiles
chmod u+x ~/.dotfiles/bin/symlinks.sh
sh ~/.dotfiles/bin/symlinks.sh

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
