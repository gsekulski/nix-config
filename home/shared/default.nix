{ config, lib, pkgs, identity, ... }:

{
  imports = [
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    ./vim.nix
    ./zed.nix
    ./zsh.nix
  ];

  home.username = identity.username;
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    age
    b3sum
    curl
    eza
    fd
    file
    fzf
    htop
    jq
    less
    ncdu
    pypy3
    python3
    ripgrep
    rsync
    sd
    sqlite
    unzip
    wget
    xxd
    yq
    zstd
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    PAGER = "less -FirSwX";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  xdg.enable = true;

  programs.home-manager.enable = true;
}
