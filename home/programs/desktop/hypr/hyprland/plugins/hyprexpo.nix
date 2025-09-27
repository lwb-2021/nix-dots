{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    plugin.hyprexpo = {
      columns = 3;
      enable_gesture = true;

      workspace_method = "first 1";
      gesture_distance = 300;
    };
    hyprexpo-gesture = [
      "3, down, expo:on"
    ];
  };
}
