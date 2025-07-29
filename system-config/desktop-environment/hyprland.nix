{ config, pkgs, lib, inputs, ... }: {
  environment.systemPackages = with pkgs;[
    hyprpolkitagent
  ];
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };
  security.polkit = {
    enable = true;
  };
  security.pam.services.hyprlock = {};
}
