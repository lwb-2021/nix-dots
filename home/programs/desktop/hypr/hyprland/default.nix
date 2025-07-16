{ config, pkgs, lib, inputs, ... }: {
  imports = [
    ./autostart.nix
    ./display.nix
    ./effects.nix
    ./environment.nix
    ./keymap.nix
    ./rules.nix
    ./plugins/hyprexpo.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    plugins = with inputs.hyprland-plugins.packages.${pkgs.system};[
      hyprexpo
    ];
  };

}
