{ config, pkgs, ... }:

let
  extentions = import ./extensions.nix;
  extraPkgs = import ../extraPkgs.nix { inherit pkgs; };
  terminal = import ./terminal.nix;
  lsp = import ./lsp.nix { inherit pkgs; };
  languages = import ./languages.nix;
  settings = import ./settings.nix;
  keymap = import ./keymap.nix;
in
{
  programs.zed-editor = {
    enable = true;
    extraPackages = extraPkgs;
    extensions = extentions;
    userSettings = settings // {
      terminal = terminal;
      lsp = lsp;
      languages = languages;
    };

    userKeymaps = keymap;
  };
}
