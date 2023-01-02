{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "aly";
  home.homeDirectory = "/Users/aly";
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";

  # Packages to install to the user profile
  home.packages = with pkgs; [
    # Shell
    starship
    direnv

    # Tools
    bat

    # Git
    gh
    git

    # Language support
    nodejs-18_x
    python310
    rustup
    jdk17
    haskell.compiler.ghc924

    # Node extras
    nodePackages.pnpm
    nodePackages.prettier
    nodePackages.typescript

    # Python extras
    black

    # Wrappers
    (callPackage ./wrappers/helix.nix { })
  ];

  # Modularized configuration files
  imports = [
    ./programs/zsh.nix
    ./programs/bash.nix
    ./programs/starship.nix
    ./programs/direnv.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/helix.nix
    ./programs/bat.nix

    ./dedicated/default.nix

    ./session.nix
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}