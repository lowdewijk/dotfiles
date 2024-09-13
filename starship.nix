{ config, pkgs, ...}:

{
  # starship - a customizable prompt for any shell
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    catppuccin.enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
}
