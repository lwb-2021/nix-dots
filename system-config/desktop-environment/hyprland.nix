{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprpolkitagent
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  security.polkit = {
    enable = true;
  };
  security.pam.services.hyprlock = { };
}
