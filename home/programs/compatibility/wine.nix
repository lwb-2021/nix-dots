{ config, lib, pkgs, ... }: {
  home.packages = with pkgs;[
    (wineWowPackages.full.override {
      wineRelease = "staging";
      waylandSupport = true;
    })
    winetricks
  ];
}
