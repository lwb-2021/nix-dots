{ config, pkgs, lib, ... }: {
  home.packages = with pkgs;[xorg.xrdb];
  wayland.windowManager.hyprland.settings = {
    monitor = ", highres, auto, 1.6";

    xwayland = {
      force_zero_scaling = true;
      create_abstract_socket = true;
    };

    exec-once = [
      "cat ~/.Xresources | xrdb -merge"
    ];

  };   
}
