{ config, lib, pkgs, ... }: {
  xdg = {
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "audio/mpeg" = "mpv.desktop";
        "audio/wav" = "mpv.desktop";
        "video/mpeg" = "mpv.desktop";
        "video/mp4" = "mpv.desktop";

        "text/plain" = "nvim.desktop";
        "text/markdown" = "nvim.desktop";
      };
    };
  };


} 
