{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
  ];
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
  };
  gtk = {
    enable = true;
    theme = {
      name = lib.mkForce "catppuccin-mocha-mauve-compact+black";
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
      size = 24;
    };
    iconTheme = {
      name = "BeautyLine";
      package = pkgs.beauty-line-icon-theme;
    };

  };
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style = {
      name = "kvantum";
    };
  };
  catppuccin = {
    enable = true;
    gtk.icon.enable = false;
    accent = "mauve";
    flavor = "mocha";
  };
}
