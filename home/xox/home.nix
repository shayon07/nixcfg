{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    ../../modules/home/Desktop/dms.nix
    ../../modules/home/kitty.nix
    ../../modules/home/Editor/nvim/nvchad.nix
    ../../modules/home/fish.nix
    ../../modules/home/starship.nix
    ../../modules/home/Desktop/mangowc.nix
    ../../modules/home/gtk.nix
    ../../modules/home/Editor/zed/zed.nix
  ];

  home.username = "xox";
  home.homeDirectory = "/home/xox";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    nerd-fonts.iosevka-term
    nerd-fonts.jetbrains-mono
    dconf
    pamixer
    pavucontrol
    zip
    unzip
    eza
    thunar
    wl-clipboard
    cliphist
    qutebrowser
    localsend
    discord
    heroic
  ];

  home.activation.setupDankMaterial = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [[ ! -f $HOME/.config/DankMaterialShell/settings.json ]]; then
      $DRY_RUN_CMD mkdir -p $HOME/.config/DankMaterialShell
      $DRY_RUN_CMD cp ${../../config/DankMaterialShell/settings.json} $HOME/.config/DankMaterialShell/settings.json
      $DRY_RUN_CMD chmod 666 $HOME/.config/DankMaterialShell/settings.json
      $VERBOSE_ECHO "Copied DankMaterialShell settings.json (first time setup)"
    fi
  '';

  fonts.fontconfig.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "xox";
      user.email = "xox@fake.me";
    };
  };

}
