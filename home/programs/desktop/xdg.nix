{ config, pkgs, ... }: {
  xdg = {
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = "nvim.desktop";
        "text/markdown" = "nvim.desktop";
      };
    };
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
