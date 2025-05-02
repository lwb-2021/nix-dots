{ config, pkgs, lib, ... }: {
    wayland.windowManager.hyprland = {
        systemd = {
            extraCommands = [
                "systemctl --user stop hyprpolkitagent.service"
                "systemctl --user stop hyprland-session.target"
                "systemctl --user start hyprland-session.target"
                "systemctl --user start hyprpolkitagent.service"
            ];
        };
        settings.exec-once = [
            "waybar"
        ];
    };

}
