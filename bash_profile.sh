# Extend `$PATH` variable
# Modify `path.sh` to add new PATH locations
source ~/.dotfiles/path.sh

# Enable terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls="ls -G"

# Load bash prompt settings
source ~/.dotfiles/prompt.sh

# Load local bash settings
if [[ -e ~/.dotfiles/local.sh ]]; then
  source ~/.dotfiles/local.sh
fi
