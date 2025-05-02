{ config, pkgs, lib, ... }: {
    wayland.windowManager.hyprland = {
        settings = {
            "$mod" = "SUPER";
            bind = [
                "$mod, Q, exec, kitty"
                "$mod, R, exec, rofi -show drun"
                "$mod, W, exec, rofi -show window"
                "$mod, C, killactive"
                "$mod, F, togglefloating"
                "$mod, l, movefocus, l"
                "$mod, h, movefocus, r"
                "$mod, k, movefocus, u"
                "$mod, j, movefocus, d"

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
