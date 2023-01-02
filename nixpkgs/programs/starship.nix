{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      command_timeout = 5000;
    };
  };
}
