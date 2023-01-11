{pkgs, ...}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
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
}
