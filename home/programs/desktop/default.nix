{ config, pkgs, inputs, ... }: {
  home.packages = with pkgs;[
    mako
    xarchiver
  ];

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

}
