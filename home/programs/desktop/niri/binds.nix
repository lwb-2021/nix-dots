{ config, ... }:
{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      mod = "Super";
    in
    {
      "${mod}+T".action = spawn-sh "${config.wayland.terminal.exec}";
      "${mod}+R".action = spawn-sh "${config.wayland.launcher.exec}";
      "${mod}+C".action = close-window;
      "Alt+Space".action = spawn-sh "${config.wayland.launcher.exec}";

      "${mod}+H".action = focus-column-left;
      "${mod}+J".action = focus-window-down;
      "${mod}+K".action = focus-window-up;
      "${mod}+L".action = focus-column-right;

      "${mod}+Minus".action = set-column-width "-10%";
      "${mod}+Equal".action = set-column-width "+10%";

      "${mod}+Shift+Escape".action = quit;

      "Print".action = spawn-sh "${config.wayland.screenshot.exec}";
    };
}
