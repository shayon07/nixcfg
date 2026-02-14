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
    };

    outputs = { self, nixpkgs, home-manager, mangowc, ... }@inputs:
    let
        system = "x86_64-linux";
    in
    {
        nixosConfigurations.homelab = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./hosts/homelab/configuration.nix
	            mangowc.nixosModules.mango
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
	                    useGlobalPkgs = true;
                        useUserPackages = true;
                        users.xox = import ./home/xox/home.nix;
	                    extraSpecialArgs = { inherit inputs; };
                        backupFileExtension = "backup";
                    };
                }
            ];
        };
    };
}

