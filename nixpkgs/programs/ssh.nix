{ config, pkgs, ... }:

{
  # SSH configuration
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        extraOptions = {
          UseKeychain = "yes";
          AddKeysToAgent = "yes";
        };
        identityFile = "${config.xdg.dataHome}/ssh/id_ed25519";
      };
    };
  };
}
