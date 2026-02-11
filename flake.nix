{
  description = "NixOS with MangoWC + Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, mango, home-manager, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        mango.nixosModules.mango
        home-manager.nixosModules.home-manager

        ./hosts/nixos/configuration.nix

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.xox = { pkgs, ... }: {
            home.stateVersion = "23.11"; # change if needed

            # Install Mango for user
            home.packages = [
              pkgs.mangowc
            ];

            # Provide Mango config in ~/.config
            home.file.".config/mango/config.conf".source =
              "${pkgs.mangowc}/etc/mango/config.conf";
          };
        }
      ];
    };
  };
}

