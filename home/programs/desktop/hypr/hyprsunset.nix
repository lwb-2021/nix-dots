{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprsunset -t 5000 -g 108 --gamma_max 108"
  ];
  home.packages = with pkgs;[
    hyprsunset
  ];
}
