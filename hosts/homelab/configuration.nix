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
  nixpkgs.config.allowBroken = true;

  boot.kernelPackages = pkgs.linuxPackages_6_18;
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
  
  services.seatd.enable = true;
  users.users.xox = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "plugdev" "bluetooth" ];
    packages = with pkgs; [ ghostty ];
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
    swww
    thunar
    bluez
    bluez-tools
    power-profiles-daemon 
    powertop 
    acpi
    zip
    unzip
    eza
    python3
    nodejs
    pamixer
    mako
  ];

  programs.fish.enable = true;
  programs.firefox.enable = true;

  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
