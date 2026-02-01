{ lib, ... }:
{
  programs.noctalia-shell = {
    enable = true;
    systemd = {
      enable = true;
    };
    settings = import ./settings.nix;
  };
  systemd.user.services."noctalia-shell".Unit = {
    After = lib.mkForce [ "niri.service" ];
    Before = [ "graphical-session.target" ];
  };
}
