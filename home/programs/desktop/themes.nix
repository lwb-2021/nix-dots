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
        "Kvantum/Graphite".source = "${pkgs.graphite-kde-theme}/share/Kvantum/Graphite";
        "Kvantum/kvantum.kvconfig".text = ''
            [General]
            theme=GraphiteDark
        '';
    };

    gtk = {
        enable = true;
        theme = {
            name = "Graphite-purple-Dark-compact";
            package = (pkgs.graphite-gtk-theme.override {
                themeVariants = [ "purple" ];
                sizeVariants = [ "compact" ];
                tweaks = [ "black" ];
                wallpapers = true;
                withGrub = true;
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
            package = pkgs.graphite-kde-theme;
        };
    };
}
