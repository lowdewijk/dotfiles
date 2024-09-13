# Dotfiles++

This repo is a little more than just some dotfiles. It uses Nix [home-manager](https://github.com/nix-community/home-manager) to manage the entire terminal environment, including all the apps that I use on the terminal, such as neovim and tmux.

## Installation

Pre-requisites:
 - Nix
 - Home-manager

Clone this repo then run:
```bash
./home-manager.sh switch
```

This will copy the files in this repo to `~/.config/home-manager` and then calls `home-manager` with the command given by the user (i.e. `switch`). 

You should know have my version of the perfect terminal environment. Install `kitty` through your own package manager (dotfiles for kitty have already been generated).

