{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        application_prefer_dark_theme = true;

        # Cursor theme name
        cursor_theme_name = lib.mkForce "phinger-cursors-dark";

        # Font name and size
        #font_name = "Cantarell 16";

        # Icon theme name
        icon_theme_name = lib.mkForce "BeautyLine";

        # GTK theme name
        theme_name = lib.mkForce "catppuccin-mocha-mauve-compact+black";
      };
    };
  };
}
