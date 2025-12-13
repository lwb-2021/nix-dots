{ pkgs, ... }:
{
  programs.regreet = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-mauve-compact+black";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ "black" ];
        variant = "mocha";
      };
    };
    cursorTheme = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
    };
    iconTheme = {
      name = "BeautyLine";
      package = pkgs.beauty-line-icon-theme;
    };
    settings = {
      GTK = {
        application_prefer_dark_theme = true;

        # Cursor theme name

        # Font name and size
        #font_name = "Cantarell 16";

        # Icon theme name

        # GTK theme name
      };
    };
  };

}
