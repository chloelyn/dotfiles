{ config, pkgs, ... }:

{
  # SSH configuration
  programs.ssh = {
    enable = true;
    controlPath = "${config.xdg.dataHome}/ssh/master-%r@%n:%p";
    userKnownHostsFile = "${config.xdg.dataHome}/ssh/known_hosts";
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
