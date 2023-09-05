# Create directories if do not exist yet
[ -d ~/Library/LaunchAgents ] || mkdir ~/Library/LaunchAgents

# create symlink to keymap configuration
ln -s ~/.dotfiles/macos/keymap.xml ~/Library/LaunchAgents/com.local.KeyRemapping.plist

# dotfiles directory
dir=$HOME/.dotfiles 

# symlinks ~/.config
[ -d ~/.config ] || mkdir ~/.config
for file in "$dir/config/"*; do
    filename=$(echo $file | rev | cut -d'/' -f-1 | rev)
    if [ ! -e ~/.config/$filename ]; then
        echo "Creating symlink to $filename in .config directory."
        ln -s -f $dir/config/$filename ~/.config/$filename
    fi
done
