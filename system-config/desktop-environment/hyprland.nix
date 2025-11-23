{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprpolkitagent
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
