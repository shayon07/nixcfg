{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.nix4nvchad.homeManagerModule
    ];

    programs.nvchad.enable = true;

    # Optional — Neovim package override (if you want a newer version)
    programs.nvchad.neovim = pkgs.neovim;

    # Optional — add extra runtime packages for LSPs etc
    programs.nvchad.extraPackages = with pkgs; [
        ripgrep
        nodePackages.bash-language-server
        dockerfile-language-server-nodejs
        python3Packages.pynvim
        nil                    # Nix LSP
        rustc
        cargo                  # For Mason Rust-based installs
    ];


    # Optional — disable backups
    programs.nvchad.backup = false;
}

