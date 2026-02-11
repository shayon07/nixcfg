{
  description = "NixOS + MangoWC + Home Manager setup";

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
          # Home Manager configuration
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.xox = { pkgs, ... }: {

            home.stateVersion = "23.11"; # adjust if needed

            # Install MangoWC, Rofi, Foot
            home.packages = [
              pkgs.mangowc
              pkgs.rofi
              pkgs.foot
            ];

            # Create Mango config in ~/.config/mango/config.conf
            home.file.".config/mango/config.conf".text = ''
              terminal = foot
              launcher = rofi
              mod = Alt
            '';
            home.file.".config/mango/config.conf".force = true;
          };
        }
      ];
    };
  };
}


