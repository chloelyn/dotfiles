{pkgs, ...}: {
  services.nix-daemon.enable = true;

  nix.package = pkgs.nix;
  nix.settings.auto-optimise-store = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
