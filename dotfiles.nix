{ config, pkgs, ... }:
{
  home.file.".config" = {
    source = ./dotfiles;
    recursive = true;
  };
}
