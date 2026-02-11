{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ./lib/zfsbootmenu.nix ];
  
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  boot.kernelPackages = pkgs.linuxPackages_6_18;
  boot.zfs.package = pkgs.zfs_unstable;
  networking.hostId = "e0f6a94f";

  boot.loader.zfsbootmenu = {
    enable = true;
    bootfs = "rpool/ROOT/nix";
  };

  networking.hostName = "nix";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Dhaka";

  # Graphics + NVIDIA
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # XServer for NVIDIA
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  # SDDM with Plasma (provides session + fixes layout)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Add basic Plasma for SDDM session detection (minimal)
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";  # Default login

  services.seatd.enable = true;

  users.users.xox = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "plugdev" ];
    packages = with pkgs; [ tree git neovim fish ];
  };

  environment.systemPackages = with pkgs; [
    kitty mangowc foot wl-clipboard grim slurp swaybg htop unzip firefox
  ];

  programs.fish.enable = true;

  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.mango.enable = true;

  # system.copySystemConfiguration = true;
  system.stateVersion = "25.11";
}

