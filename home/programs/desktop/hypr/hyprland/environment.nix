{ config, pkgs, lib, ... }: {
  wayland.windowManager.hyprland = {
    systemd = {
      variables = ["--all"];
    };
    settings = {
      env = [];
    };
  };
  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

}
