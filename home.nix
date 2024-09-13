{ config, pkgs, ... }:

let 
  username = builtins.getEnv "USER";
in {
  imports = [
    <catppuccin/modules/home-manager>
    ./dotfiles.nix
    ./ssh.nix
    ./git.nix
    ./zsh.nix
    ./starship.nix
    ./tmux.nix
    ./bat.nix
    ./fzf.nix
    ./fonts.nix
  ];

  home.packages = with pkgs; [
    wget
    eza
    direnv
    
    neofetch
    xsel
    
    # archives
    zip
    xz
    unzip
    p7zip
    
    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    
    
    # misc
    cowsay
    file
    which
    
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    
    lsof # list open files
  ];

  home.username = username; 
  home.homeDirectory = "/home/${username}";

  catppuccin.flavor = "mocha";

  programs.home-manager = {
    enable = true;
  };

  # never change this
  home.stateVersion = "24.05";
}
