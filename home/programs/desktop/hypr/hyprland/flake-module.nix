{ config, lib, pkgs, input, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    plugins = with inputs.hyprland-plugins.packages.${pkgs.system};[
      hyprexpo
    ];
  };
}
