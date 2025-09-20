{ lib, pkgs, ... }:
{

  wayland.windowManager.hyprland.settings = {
    ecosystem.enforce_permissions = true;
    permission = [
      "${lib.escapeRegex (lib.getExe pkgs.grim)}, screencopy, allow"
      "${lib.escapeRegex (lib.getExe pkgs.hyprlock)}, screencopy, allow"
      "${lib.escapeRegex "${pkgs.xdg-desktop-portal-hyprland}"}/libexec/.xdg-desktop-portal-hyprland-wrapped, screencopy, allow"
      "${lib.escapeRegex "${pkgs.hyprland}"}/bin/hyprctl, plugin, allow"
    ];
  };

}
