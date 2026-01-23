{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs.noCuda.obs-studio;
    enableVirtualCamera = true;
  };
}
