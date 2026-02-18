{ config, pkgs, lib, ... }:

{
  imports = [
    ./bluetooth.nix
    ./sound.nix
    ./powerProfile.nix
    ./upower.nix
  ];
}

