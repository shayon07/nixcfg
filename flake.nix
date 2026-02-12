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
        
        # Your main system config
        ./hosts/nixos/configuration.nix

        # Home-Manager for user xox (FIXED: no 'inputs' reference)
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          # Removed: home-manager.extraSpecialArgs = { inherit inputs; };

          home-manager.users.xox = { pkgs, ... }: {
            home.stateVersion = "25.11";

            # MangoWC config from your ~/nixcfg/home/mango/config.conf
            home.file.".config/mango/config.conf".source = ./home/mango/config.conf;

            # Essential packages
            home.packages = with pkgs; [
              mangowc
              kitty
              foot
              wl-clipboard
              grim
              slurp
              swaybg
            ];
          };
        }
      ];
    };
  };
}

