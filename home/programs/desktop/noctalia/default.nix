{ lib, ... }:
{
  programs.noctalia-shell = {
    enable = true;
    systemd = {
      enable = true;
    };
    settings = import ./settings.nix;
  };
  systemd.user.services."noctalia-shell".Unit.After = lib.mkForce [ "grapical-session-pre.target" ];
}
