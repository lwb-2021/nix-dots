{ config, pkgs, lib, ... }: {
  home.packages = with pkgs;[
    dex
  ];
  home.file.".config/autostart.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      ags run &
      sleep 2s
      dex -a
      element-desktop --hidden &
    '';
  };

  wayland.windowManager.hyprland = {
    systemd = {
      enable = true;
      enableXdgAutostart = false;
      extraCommands = [
        "systemctl --user stop hyprpolkitagent.service"
        "systemctl --user stop hyprland-session.target"
        "systemctl --user start hyprland-session.target"
        "systemctl --user start hyprpolkitagent.service"
      ];
    };
    settings.exec-once = [
      "~/.config/autostart.sh &"
    ];
  };

}
