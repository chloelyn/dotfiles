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
    personal.url = "github:alaidriel/nix-packages";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    darwin,
    rust-overlay,
    personal,
    ...
  }: {
    darwinConfigurations.europa = let
      system = "x86_64-darwin";
      pkgs = import nixpkgs {inherit system;};
    in let
      sys-config = import ./machines/darwin {
        inherit (pkgs) lib;
        inherit inputs;
        inherit pkgs;
      };
    in
      darwin.lib.darwinSystem {
        inherit system;

        modules = [
          sys-config

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = {
              aly = import ./users/aly;
            };
          }
        ];
      };
  };
}
