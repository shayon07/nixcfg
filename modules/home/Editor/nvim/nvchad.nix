{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nix4nvchad.homeManagerModule
  ];

  programs.nvchad.enable = true;

  # Optional — Neovim package override (if you want a newer version)
  programs.nvchad.neovim = pkgs.neovim;

  # Optional — add extra runtime packages for LSPs etc
  programs.nvchad.extraPackages = import ../extraPkgs.nix { inherit pkgs; };

  # Optional — disable backups
  programs.nvchad.backup = false;
}
