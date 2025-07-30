{ config, pkgs, lib, ... }: {
  config = {
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
  };

}
