{ config, lib, pkgs, ... }:

{

    imports = [
        ../../modules/home/Desktop/dms.nix
        ../../modules/home/kitty.nix
        ../../modules/home/nvim.nix
        ../../modules/home/fish.nix
        ../../modules/home/starship.nix
        ../../modules/home/Desktop/mangowc.nix
    ];

    home.username = "xox";
    home.homeDirectory = "/home/xox";
    home.stateVersion = "25.11";
    home.packages = with pkgs; [
        iosevka  # Base Iosevka
        nerd-fonts.iosevka-term
        jetbrains-mono
        nerd-fonts.jetbrains-mono
    ];
    fonts.fontconfig.enable = true;

    # home.nix configuration
    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.vimix-cursors;  #vanilla-dmz; # or pkgs.bibata-cursors
        name =  "Vimix-cursors";  #"Vanilla-DMZ"; # or "Bibata-Modern-Classic"
        size = 36;
    };
    
    programs.git = {
        enable = true;
        settings = {
            user.name = "xox";
            user.email = "xox@fake.me";
        };
    };

}

