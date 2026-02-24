{
  description = "NixOS with MangoWc Setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvchad-starter = {
      url = "github:shayon07/nvim";
      flake = false;
    };

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "nvchad-starter";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, mangowc, ... }@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";

    mkSystem =
      { hostname, monitor }:
      lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs monitor;
        };

        modules = [
          ./hosts/${hostname}/configuration.nix

          mangowc.nixosModules.mango
          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";

              # 👇 IMPORTANT: match user per host
              users =
                if hostname == "homelab" then {
                  xox = import ./home/xox/home.nix;
                } else {
                  kai = import ./home/kai/home.nix;
                };

              extraSpecialArgs = {
                inherit inputs monitor;
              };
            };
          }
        ];
      };
  in
  {
    nixosConfigurations = {
      homelab = mkSystem {
        hostname = "homelab";
        monitor = {
          name = "eDP-1";
          width = 3840;
          height = 2400;
          scale = 1.4;
          refresh = 60;
        };
      };

      inspiron = mkSystem {
        hostname = "inspiron";
        monitor = {
          name = "eDP-1";
          width = 1920;
          height = 1080;
          scale = 1.0;
          refresh = 60;
        };
      };
    };

    devShells.${system}.default =
      nixpkgs.legacyPackages.${system}.mkShell {
        buildInputs = [ nixpkgs.legacyPackages.${system}.nil ];
        shellHook = ''
          echo "NixOS config dev environment"
        '';
      };

    formatter.${system} =
      nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
  };
}
