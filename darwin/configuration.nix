{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    exa
    fd
    du-dust
    ripgrep
    jq
    tldr
    btop
    jdk17
  ];

  environment.loginShell = "${pkgs.zsh}/bin/zsh -l";
  environment.shells = with pkgs; [
    zsh
  ];

  security.pam.enableSudoTouchIdAuth = true;

  # https://github.com/LnL7/nix-darwin/issues/423
  users.users.aly = {
    name = "aly";
    home = "/Users/aly";
  };

  # Nix
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
