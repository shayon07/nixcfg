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
    ../../modules/home/nvim/nvchad.nix
    ../../modules/home/fish.nix
    ../../modules/home/starship.nix
    ../../modules/home/Desktop/mangowc.nix
  ];

  home.username = "kai";
  home.homeDirectory = "/home/kai";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    nerd-fonts.iosevka-term
    nerd-fonts.jetbrains-mono
    vimix-cursors
    pamixer
    zip
    unzip
    eza
    thunar
    wl-clipboard
    cliphist
    python3
    qutebrowser
    localsend
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
      user.name = "kai";
      user.email = "kai@fake.me";
    };
  };

}
