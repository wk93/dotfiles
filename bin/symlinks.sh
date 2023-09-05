# Create directories if do not exist yet
[ -d ~/Library/LaunchAgents ] || mkdir ~/Library/LaunchAgents

# create symlink to keymap configuration
ln -s ~/.dotfiles/macos/keymap.xml ~/Library/LaunchAgents/com.local.KeyRemapping.plist
