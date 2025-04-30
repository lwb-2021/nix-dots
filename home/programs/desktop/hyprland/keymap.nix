{ config, pkgs, lib, ... }: {
    wayland.windowManager.hyprland = {
        settings = {
            "$mod" = "SUPER";
            bind = [
                "$mod, R, exec, rofi -show drun"
            ]
            ++ (
                builtins.concatLists(builtins.genList(i:
                    let ws = i + 1;
                    in [
                        "$mod, code:1${toString i}, workspace, ${toString ws}"
                        "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                    ]
                )
                9) 
            );

        };
    };

}
