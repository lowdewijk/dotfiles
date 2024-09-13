#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Check if no arguments were provided
if [ $# -eq 0 ]; then
  echo "No arguments provided. Run 'home-manager --help' for a full listing."
  exit 1
fi

echo "Copying nix files from $SCRIPT_DIR to /home/$USER/.config/home-manager"
cp -f $SCRIPT_DIR/*.nix /home/$USER/.config/home-manager
cp -fr $SCRIPT_DIR/dotfiles /home/$USER/.config/home-manager

home-manager $@
