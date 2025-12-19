{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprpolkitagent
  ];
  programs.hyprland = {
    enable = true;
    package = null;
    xwayland.enable = true;
  };
}
