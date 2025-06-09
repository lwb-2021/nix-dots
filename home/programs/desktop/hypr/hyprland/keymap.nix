{ config, pkgs, lib, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, kitty -1"
        "$mod, E, exec, kitty -1 yazi"
        "$mod, R, exec, rofi -show drun"
        "$mod, W, exec, rofi -show window"
        "$mod, C, killactive"
        "$mod, F, togglefloating"
        "$mod, l, movefocus, l"
        "$mod, h, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
        "$mod, Tab, hyprexpo:expo, toggle"

      ]
        ++ (
          builtins.concatLists(builtins.genList(i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
            10) 
        );
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];

    };
  };

}
