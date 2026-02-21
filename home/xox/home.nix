{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [
    ../../modules/home/Desktop/dms.nix
    ../../modules/home/kitty.nix
    ../../modules/home/nvim/nvchad.nix
    ../../modules/home/fish.nix
    ../../modules/home/starship.nix
    ../../modules/home/Desktop/mangowc.nix
  ];

  home.username = "xox";
  home.homeDirectory = "/home/xox";
  home.stateVersion = "25.11";
  home.activation.setupDankMaterial = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [[ ! -f $HOME/.config/DankMaterialShell/settings.json ]]; then
      $DRY_RUN_CMD mkdir -p $HOME/.config/DankMaterialShell
      $DRY_RUN_CMD cp ${../../config/DankMaterialShell/settings.json} $HOME/.config/DankMaterialShell/settings.json
      $VERBOSE_ECHO "Copied DankMaterialShell settings.json (first time setup)"
    fi
  '';

  home.packages = with pkgs; [
    iosevka # Base Iosevka
    nerd-fonts.iosevka-term
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    vimix-cursors
    papirus-icon-theme
    adwaita-icon-theme
    eza
    zip
    unzip
    python3
    thunar
    localsend
    discord
    heroic
  ];

  fonts.fontconfig.enable = true;

  # home.nix configuration
  # home.pointerCursor = {
  #     gtk.enable = true;
  #     x11.enable = true;
  #     package = pkgs.vimix-cursors;  #vanilla-dmz; # or pkgs.bibata-cursors
  #     name =  "Vimix-cursors";  #"Vanilla-DMZ"; # or "Bibata-Modern-Classic"
  #     size = 30;
  # };

  programs.git = {
    enable = true;
    settings = {
      user.name = "xox";
      user.email = "xox@fake.me";
    };
  };

}
