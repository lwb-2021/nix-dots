{ config, pkgs, lib, ... }: {
    wayland.windowManager.hyprland = {
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
            env = []
            ++ (lib.mapAttrsToList (name: value: "${name},${builtins.toString value}") config.home.sessionVariables);
        };
    };

}
