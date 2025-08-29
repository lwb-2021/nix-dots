{ ... }:
{
  programs.waybar = {
    enable = true;
  };
  autostart.prepareCommands = [ "waybar & sleep 1s" ];
}
