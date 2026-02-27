{ inputs, pkgs, ... }:
{
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    extraPackages = epkgs: with epkgs; [
      ripgrep
      fd
      nodejs
      python3
    ];
}

