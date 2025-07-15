{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs;[
    phinger-cursors
    beauty-line-icon-theme
    (graphite-gtk-theme.override {
      themeVariants = [ "purple" ];
      sizeVariants = [ "compact" ];
      tweaks = [ "black" ];
      wallpapers = true;
      withGrub = true;
    })
  ];

}
