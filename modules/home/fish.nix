{ config, pkgs, ... }:
{
    programs.fish = {
        enable = true;
        shellAbbrs = {
            nrs = "sudo nixos-rebuild switch";
            nglist = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
            ngwipe = "sudo nix-env --delete-generations --profile /nix/var/nix/profiles/system +2 && sudo nix-collect-garbage -d"; 
        };
    };
}
