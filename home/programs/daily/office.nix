{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    libreoffice-fresh
    pkgs.jdk17
  ];

}
