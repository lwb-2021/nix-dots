{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    useNautilus = false;
  };
  security.soteria.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
    ];
    config.niri = {
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ]; # or "kde"
    };
  };
}
