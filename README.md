# Dotfiles++

This repo is a little more than just some dotfiles. It uses Nix [home-manager](https://github.com/nix-community/home-manager) to manage the entire terminal environment, including all the apps that I use on the terminal, such as neovim and tmux.

## My terminal environment
 
 - kitty, dotfiles are included but kitty itself is not (theme = catppuccin)
 - tmux (theme = catppuccin)
 - neovim (theme = catppuccin) 
 - zsh (no oh-my-zsh, but heavily customized)
 - git
 - eza (instead of ls)
 - bat (instead of cat)
 - fzf
 - a whole bunch of other terminal commands...
  
## Installation

Pre-requisites:
 - Nix (enable flake support)
 - Home-manager
 - Kitty

Clone this repo then run:
```bash
nix run . -- switch --flake .
```

You should know have my version of the perfect terminal environment. Kitty should be perfect now. 

