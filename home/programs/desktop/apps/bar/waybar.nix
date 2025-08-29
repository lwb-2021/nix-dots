{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        fixed-center = true;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "" ];
        moudles-right = [ "tray" ];

      };
      # dock = {
      #   layer = "bottom";
      #   position = "bottom";
      #   mode = "hide";
      #   start_hidden = true;
      #   height = 36;
      #   fixed-center = false;

      #   modules-left = [ "" ];
      #   modules-center = [ "hyprland/window" ];
      #   moudles-right = [ "tray" ];
      # };
    };
  };
  autostart.prepareCommands = [ "waybar & sleep 1s" ];
}
