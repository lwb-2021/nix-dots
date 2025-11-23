{ config, ... }:
{
  programs.niri.settings.bind =
    with config.lib.niri.actions;
    let
      mod = "Super";
    in
    {
      "${mod}+T".action = spawn "${config.wayland.terminal.exec}";
      "${mod}+R".action = spawn "${config.wayland.launcher.exec}";
      "Print".action = spawn "${config.wayland.screenshot.exec}";
    };
}
