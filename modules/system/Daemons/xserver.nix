{ config, lib, pkgs, ... }:
{
    services.xserver = {
        enable = true;
        videoDrivers = [ "nvidia" ];
    };
}
