{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix
    ../../lib/zfsbootmenu.nix
    ../../modules/Desktop/mangowc.nix
    ../../modules/system/Daemons/default.nix
    ../../modules/system/Graphics/nvidia.nix
    ../../modules/system/Greeters/sddm.nix
    ../../modules/system/Daemons/xserver.nix
  ];
  
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowBroken = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.zfs.package = pkgs.zfs_unstable;
  boot.loader.zfsbootmenu = {
    enable = true;
    bootfs = "rpool/ROOT/nix";
  };

  networking.hostId = "e0f6a94f";
  networking.hostName = "homelab";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Dhaka";

  # Graphics + NVIDIA
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.enableRedistributableFirmware = true;

  services.seatd.enable = true;
  users.users.xox = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "plugdev" "bluetooth" ];
    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [
    git 
    tree 
    wl-clipboard 
    bat 
    btop 
    neovim
    kitty
    xwayland-satellite
    xorg.xrdb
    wlr-randr           # For monitor testing
    cliphist
    thunar
    bluez
    bluez-tools
    power-profiles-daemon 
    powertop 
    acpi
    eza
    pamixer
    pciutils
    mesa-demos
    alsa-utils
    pavucontrol
  ];

  programs.fish.enable = true;
  programs.firefox.enable = true;

  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 53317 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
