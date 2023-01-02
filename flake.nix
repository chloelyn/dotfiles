{
  description = "Alaina's macOS configuration!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }:
    let
      system = "x86_64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      darwinConfigurations.europa = darwin.lib.darwinSystem {
        inherit pkgs;

        system = system;

        modules = [
          ./darwin/configuration.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users = {
              aly = import ./home-manager/home.nix;
            };
          }
        ];
      };
    };
}
