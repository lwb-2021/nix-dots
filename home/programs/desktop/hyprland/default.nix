{ config, pkgs, lib, ... }: {
    imports = [
        ./environment.nix
        ./keymap.nix
    ];
    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        systemd = {
            variables = ["--all"];
            extraCommands = [
                "systemctl --user stop hyprpolkitagent.service"
                "systemctl --user stop hyprland-session.target"
                "systemctl --user start hyprland-session.target"
                "systemctl --user start hyprpolkitagent.service"
            ];

        };
        settings = {
        };
    };

}
