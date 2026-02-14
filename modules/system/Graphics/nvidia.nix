{ config, lib, pkgs, ... }:
{
    hardware.nvidia = {
        modesetting.enable = true;
        nvidiaSettings = true;
        open = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
}
