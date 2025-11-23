{ config, lib, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, ${config.wayland.terminal.exec}"
        "$mod, E, exec, thunar"
        "$mod, R, exec, ${config.wayland.launcher.exec}"
        "ALT, SPACE, exec, ${config.wayland.launcher.exec}"
        "$mod, C, killactive"
        "$mod, F, togglefloating"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod, Tab, hyprexpo:expo, toggle"
        "$mod, H, layoutmsg, move -col"
        "$mod, L, layoutmsg, move +col"
        "$mod, EQUAL, layoutmsg, colresize +conf"
        "$mod, SUBTRACT, layoutmsg, colresize -conf"

        "$mod, ESC, exec, hyprlock"

        ", Print, exec, ${config.wayland.screenshot.exec}"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 10
      ));
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
