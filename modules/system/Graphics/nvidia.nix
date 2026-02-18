{ config, lib, pkgs, ... }:
{
    hardware.nvidia = {
        modesetting.enable = true;
        nvidiaSettings = true;
        open = false;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        prime = {
            offload.enable = true;
            intelBusId = "PCI:0:2:0";     # From your lspci
            nvidiaBusId = "PCI:1:0:0";   # From your lspci
        };
    };
}
