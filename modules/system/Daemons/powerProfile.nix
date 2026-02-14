{ config, pkgs, ... }:
{
  services.power-profiles-daemon.enable = true;
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
}
