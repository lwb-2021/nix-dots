{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.mpv = {
    enable = true;
  };
  xdg.mimeApps.defaultApplications = {
    "audio/mpeg" = "mpv.desktop";
    "audio/wav" = "mpv.desktop";
    "video/mpeg" = "mpv.desktop";
    "video/mp4" = "mpv.desktop";

  };
}
