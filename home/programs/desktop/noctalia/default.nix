{ ... }:
{
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    settings = import ./settings.nix;
  };
}
