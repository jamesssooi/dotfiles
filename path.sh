#!/usr/bin/env bash

# PATH MANAGEMENT SCRIPT
# ==============================================================================

# Add PATH entries here
paths=(
  '~/bin'
  '/usr/local/opt/openjdk@11/bin'
  "$PATH"
  '/Users/james.ooi/Library/Android/sdk/platform-tools'
)

path=''

for p in ${paths[@]}; do
  if [[ -z $path ]]; then
    path="$p"
  else
    path="$path:$p" 
  fi
done

export PATH="$path"
