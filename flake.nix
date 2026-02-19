{
    description = "NixOS with MangoWc Setup";  # ← Unchanged

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
            # url = "path:<local_path>" # <- for local relative folder (e.g. path:./home/nvim) 
            flake = false;
        };
        nix4nvchad = {
            url = "github:nix-community/nix4nvchad";  # Official NvChad Nix flake
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.nvchad-starter.follows = "nvchad-starter"; # <- overwrite the module input here
        };
    };

    outputs = { self, nixpkgs, home-manager, mangowc, ... }@inputs:
    let
        # ↑ NEW: Extract common library and system definition
        lib = nixpkgs.lib;                    # Standard NixOS library (helps with list folding, etc.)
        system = "x86_64-linux";              # Define once, use everywhere
        
        # ↑ NEW: DRY principle - reusable function for any host
        # Instead of repeating 30+ lines per host, define once
        mkSystem = hostname: lib.nixosSystem {
            inherit system;                           # Use defined system
            specialArgs = { inherit inputs; };        # Pass all inputs to modules
            modules = [
                # Host-specific configuration (your existing file)
                ./hosts/${hostname}/configuration.nix
                
                # Core modules (your existing ones, unchanged order!)
                mangowc.nixosModules.mango
                home-manager.nixosModules.home-manager
                
                # Home Manager setup (your exact existing config)
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        backupFileExtension = "backup";
                        users.xox = import ./home/xox/home.nix;  # Your existing user config
                        extraSpecialArgs = { inherit inputs; };
                    };
                }
            ];
        };
    in {
        # ↑ NEW: Organized output structure (standard flake pattern)
        # Now supports multiple hosts easily
        nixosConfigurations = {
            homelab = mkSystem "homelab";  # ← Your existing host, now using mkSystem
            # mylaptop = mkSystem "mylaptop"; # ← Add more hosts like this (1 line each)
        };

        # ↑ NEW: Development tools (nice-to-have, optional)
        devShells.${system}.default = nixpkgs.legacyPackages.${system}.mkShell {
            buildInputs = [ nixpkgs.legacyPackages.${system}.nil ];  # Nix LSP for editors
            shellHook = ''
                echo "NixOS config dev environment"
            '';
        };

        # ↑ NEW: Code formatter (runs with `nix fmt`)
        formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
    };
}

