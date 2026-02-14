{ config, pkgs, ... }:
{
    # Add Rofi configuration
    programs.rofi = {
        enable = true;
        extraConfig = {
            modi = "run,drun,window";
            show-icons = true;
            icon-theme = "Papirus";  # or your preferred icon theme
        };
    };
}

