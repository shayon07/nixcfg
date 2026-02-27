{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../lib/zfsbootmenu.nix
    ../../modules/Desktop/mangowc.nix
    ../../modules/system/Daemons/default.nix
    ../../modules/system/Graphics/nvidia.nix
    ../../modules/system/Greeters/ly.nix
    # ../../modules/system/Daemons/xserver.nix
  ];

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowBroken = true;

  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.blacklistedKernelModules = [ "nouveau" ];
  boot.kernelParams = [
    "nvidia_drm.modeset=1"
    # "nouveau.config=NvGspRm=0"
  ];
  boot.zfs.package = pkgs.zfs_unstable;
  boot.loader.zfsbootmenu = {
    enable = true;
    bootfs = "rpool/ROOT/nix";
  };

  networking.hostId = "e0f6a94f";
  networking.hostName = "homelab";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Dhaka";

  # Graphics
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.enableRedistributableFirmware = true;

  # services.seatd.enable = true;
  users.users.xox = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "plugdev"
      "bluetooth"
    ];
    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [
    git
    tree
    bat
    kitty
    xrdb
    wlr-randr # For monitor testing
    bluez
    bluez-tools
    pciutils
  ];

  programs.fish.enable = true;

  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [
    22
    53317
  ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.11";
}
