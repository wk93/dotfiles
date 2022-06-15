# Aliases
alias cat='bat'
alias ls='exa -lah --time-style long-iso --octal-permissions --no-permissions --group-directories-first'

# For brew, at least
export PATH=/usr/local/bin:$PATH

# Node Version Manager
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
