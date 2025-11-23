{ pkgs, ... }:
{
  imports = [
    ./binds.nix
  ];
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      spawn-at-startup = [
        { argv = [ "~/.config/autostart.sh" ]; }
      ];
    };
  };
}
