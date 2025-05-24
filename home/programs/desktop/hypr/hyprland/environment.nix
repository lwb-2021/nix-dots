{ config, pkgs, lib, ... }: {
    wayland.windowManager.hyprland = {
        systemd = {
            variables = ["--all"];
        };
        settings = {
            env = []
            ++ (lib.mapAttrsToList (name: value: "${name},${builtins.toString value}") config.home.sessionVariables);
        };
    };

}
