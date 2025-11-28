{ lib, pkgs, ... }:
{
  imports = [
    ./binds.nix
    ./layout.nix
    ./rules.nix
  ];
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      input = {
        touchpad = {
          natural-scroll = false;
        };
      };
      prefer-no-csd = true;
      spawn-at-startup = [
        { argv = [ "~/.config/autostart.sh" ]; }
      ];
      xwayland-satellite = {
        enable = true;
        path = lib.getExe pkgs.xwayland-satellite;
      };
    };
  };
}
