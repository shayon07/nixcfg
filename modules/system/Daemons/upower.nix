# modules/system/Daemons/upower.nix
{ config, lib, pkgs, ... }:
{
  services.upower = {
    enable = true;
    # Valid options only:
    percentageLow = 20;
    percentageCritical = 5;
    percentageAction = 3;
    criticalPowerAction = "HybridSleep";
  };
}

