{ config, pkgs, lib, ... }: {
  home.packages = with pkgs;[
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
  xdg.configFile = {
    "Kvantum/catppuccin-mocha-mauve".source = "${(pkgs.catppuccin-kvantum.override {
        accent = "mauve";
        variant = "mocha";
      })}/share/Kvantum/catppuccin-mocha-mauve";
    "Kvantum/kvantum.kvconfig".text = ''
            [General]
            theme=catppuccin-mocha-mauve
    '';
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-mauve-compact+black";
      package = (pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [ "black" ];
        variant = "mocha";
      }); 
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
    platformTheme.name = "qtct";
    style = {
      name = "kvantum-dark";
      package = pkgs.catppuccin-kvantum.override {
        accent = "mauve";
        variant = "mocha";
      };
    };
  };
}
