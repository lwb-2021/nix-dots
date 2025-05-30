{ config, lib, pkgs, inputs, ... }: {
  home-manager.users.lwb.wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    plugins = with inputs.hyprland-plugins.packages.${pkgs.system};[
      hyprexpo
    ];
  };
}
