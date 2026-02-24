{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./zfsbootmenu.nix
    ../../modules/Desktop/mangowc.nix
    ../../modules/system/Daemons/default.nix
    ../../modules/system/Greeters/sddm.nix
    # ../../modules/system/Daemons/xserver.nix
  ];

  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowBroken = true;

  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.zfs.package = pkgs.zfs_unstable;
  boot.loader.zfsbootmenu = {
    enable = true;
    bootfs = "rpool/ROOT/nix";
  };

  networking.hostId = "ae8a602d";
  networking.hostName = "inspiron";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Dhaka";

  # Graphics + NVIDIA
  # hardware.graphics.enable = true;
  # hardware.graphics.enable32Bit = true;
  # hardware.enableRedistributableFirmware = true;

  services.seatd.enable = true;
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
    btop
    kitty
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
