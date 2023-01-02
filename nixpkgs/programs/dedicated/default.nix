{ config, ... }:

{
  config.home.file.".config/btop" = { source = ./btop; };
}
