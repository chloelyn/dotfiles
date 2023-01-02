{ config, ... }:

{
  config.home.file.".config/btop" = { source = ./btop; };
  config.home.file.".config/neofetch" = { source = ./neofetch; };
}
