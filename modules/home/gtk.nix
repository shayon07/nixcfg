{
  config,
  lib,
  pkgs,
  ...
}:

let
  GTK_THEME_NAME = "adw-gtk3";
  GTK_CURSOR_NAME = "Vimix-cursors";
  GTK_CURSOR_SIZE = 28;
  GTK_ICONS_NAME = "Tela";
  # GTK_FONT = "Monospace 10";
  # GTK_DARK = true;

  GTK_THEME_PACKAGE = pkgs.adw-gtk3;
  GTK_CURSOR_PACKAGE = pkgs.vimix-cursors;
  GTK_ICONS_PACKAGE = pkgs.tela-icon-theme;
in
{
  home = {
    pointerCursor = {
      name = GTK_CURSOR_NAME;
      gtk.enable = true;
      package = GTK_CURSOR_PACKAGE;
      size = GTK_CURSOR_SIZE;
    };

    # sessionVariables = {
    #   GTK_THEME = GTK_THEME_NAME;
    # };
  };

  gtk = {
    enable = true;

    theme = {
      name = GTK_THEME_NAME;
      package = GTK_THEME_PACKAGE;
    };
    iconTheme = {
      name = GTK_ICONS_NAME;
      package = GTK_ICONS_PACKAGE;
    };
    cursorTheme = {
      name = GTK_CURSOR_NAME;
      package = GTK_CURSOR_PACKAGE;
    };

    # gtk3 = {
    #   extraConfig = {
    #     gtk-application-prefer-dark-theme = GTK_DARK;
    #     gtk-font-name = GTK_FONT;
    #     gtk-cursor-theme-size = GTK_CURSOR_SIZE;
    #   };
    # };
  };

  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     gtk-theme = GTK_THEME_NAME;
  #     color-scheme = lib.mkIf GTK_DARK "prefer-dark";
  #   };
  # };
}
