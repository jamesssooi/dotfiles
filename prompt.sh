#!/usr/bin/env bash

# BASH PROMPT CONFIGURATION
# ==============================================================================

triangle_icon=$'\uE0B0'
git_icon=$'\uE0A0'
prompt_icon=$'❯'

# Function to display Git branch
formatted_git_branch() {
  local branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
  
  # Change background color if there are changes
  if [[ `git status --porcelain 2>/dev/null` ]]; then
    local bg_color="41"
    local arrow_color="31"
  else
    local bg_color="42"
    local arrow_color="32"
  fi

  if [[ -z $branch ]]; then
    echo -e "\033[34m$triangle_icon\033[m"
  else 
    echo -en "\033[34;${bg_color}m$triangle_icon\033[m"
    echo -en "\033[${bg_color};30m $git_icon $branch \033[m"
    echo -en "\033[${arrow_color}m$triangle_icon\033[m"
  fi  
}

# Build PS1 prompt
PS1="\n\[\033[100m\] @\u \033[m" # Username
PS1+="\[\033[90;44m\]$triangle_icon\033[m" # Powerline connector
PS1+="\[\033[44m\] \w \033[m" # Current working directory
PS1+="\$(formatted_git_branch)" # Git information
PS1+="\n $prompt_icon " # Prompt icon

# Export $PS1 environment variable
export PS1
