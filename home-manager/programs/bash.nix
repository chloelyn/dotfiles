{ config, pkgs, ... }:

{
  # Bash configuration
  programs.bash = {
    enable = true;
    enableCompletion = false;
    shellOptions = [ ];
    historyFile = "${config.xdg.dataHome}/bash/bash_history";
  };
}
