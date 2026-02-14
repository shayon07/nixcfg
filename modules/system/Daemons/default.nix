{ config, pkgs, lib, ... }:

{
  imports = [
    ./bluetooth.nix
    ./pipewire.nix
    ./powerProfile.nix
    ./upower.nix
  ];
}

