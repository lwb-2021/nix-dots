{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nomacs-qt6
  ];
  xdg.mimeApps.defaultApplications = {
    "image/jpeg" = "nomacs.desktop";
    "image/png" = "nomacs.desktop";
    "image/bmp" = "nomacs.desktop";
  };

}
