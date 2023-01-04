{
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
    rust-overlay.url = "github:oxalica/rust-overlay";
    personal.url = "github:alaidriel/nix-overlay";
  };

  outputs = { self, nixpkgs, home-manager, darwin, rust-overlay, personal, ... }: {
    darwinConfigurations.europa = darwin.lib.darwinSystem
      {
        system = "x86_64-darwin";

        modules = [
          ({
            nixpkgs.overlays = [
              rust-overlay.overlays.default
              personal.overlays.default
            ];
          })

          ./darwin/configuration.nix

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = {
              aly = import ./home-manager/home.nix;
            };
          }
        ];
      };
  };
}
