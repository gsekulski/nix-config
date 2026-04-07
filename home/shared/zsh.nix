{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    shellAliases = {
      "2." = "../..";
      "3." = "../../..";
      "4." = "../../../..";
      "5." = "../../../../..";
      "v" = "vim";
      "ls" = "eza --group-directories-first --almost-all";
      "ll" = "eza -l --group-directories-first --almost-all";
      "la" = "eza -la --group-directories-first";
    };
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autocd = true;
    initContent = ''
      export TERM=xterm-256color
      PROMPT=%'n@%m %~ %# '
    '';
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
  };
}