{ lib, pkgs, ... }:
{
  imports = [
    ./binds.nix
    ./layout.nix
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
      spawn-at-startup = [
        { argv = [ "~/.config/autostart.sh" ]; }
        { argv = [ "${lib.getExe pkgs.xwayland-satellite}" ]; }
      ];
    };
  };
}
