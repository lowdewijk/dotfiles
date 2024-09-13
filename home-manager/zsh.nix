{ config, pkgs, ...}:

{
  programs.zsh = {
     enable = true;

     enableCompletion = true;
     syntaxHighlighting.enable = true;
     syntaxHighlighting.catppuccin.enable = true;
     autocd = true;

     shellAliases = {
       v = "nvim";
       l = "eza";
       ls = "eza";
       ll = "eza -l";
       tree = "eza --tree";
       cat = "bat";
       ga = "git add -A";
       gs = "git status";
       gd = "git diff";
       gc = "git commit";
       gcm = "git commit -m";
       gp = "git push";
     };
     completionInit = "autoload -U compinit && compinit -i";
     initExtra = ''
        # so tmux knows that it should start in this shell 
        export SHELL=$(which zsh)

        # remove annoying message when * result in no match
        setopt +o nomatch

        # setup starship and direnv
        eval "$(starship init zsh)"
        eval "$(direnv hook zsh)"

        # run neofetch the first time a console is started
        LIVE_COUNTER=$(ps a | awk '{print $2}' | grep -vi -e "tty*" -e "?" | uniq | wc -l);
        if [ $LIVE_COUNTER -eq 1 ]; then
          neofetch
        fi

        # run extra zshrc that is not managed by this project
        if [ -f "$HOME/.extra_zshrc" ]; then
          source "$HOME/.extra_zshrc"
        fi
     '';
     history = {
       extended = true;
       size = 10000;
     };
    sessionVariables = {
      # Suppress direnv logs
      DIRENV_LOG_FORMAT = "";

      # Don't use nano
      EDITOR = "nvim";
    };
    plugins = [
      {
        name = "nix-shell";
        src = "${pkgs.zsh-nix-shell}/share/zsh/site-functions";
      }
      {
        name = "nnn-quitcd";
        file = "share/quitcd/quitcd.bash_sh_zsh";
        src = pkgs.nnn;
      }
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
      rec {
        name = "you-should-use";
        src = pkgs.zsh-you-should-use;
        file = "share/zsh/plugins/${name}/${name}.plugin.zsh";
      }
      rec {
        name = "bd";
        src = pkgs.zsh-bd;
        file = "share/zsh-${name}/${name}.plugin.zsh";
      }
    ];
 };

}
