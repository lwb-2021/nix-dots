{ config, pkgs, ... }: {
  xdg = {
    autostart.enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = "nvim.desktop";
        "text/markdown" = "nvim.desktop";
        "inode/directory" = "thunar.desktop";
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
