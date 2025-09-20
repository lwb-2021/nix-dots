{ ... }:
{

  wayland.windowManager.hyprland.settings = {
    ecosystem.enforce_permission = true;
    permission = [
      # "grim, screencopy, allow"
      ""
    ];
  };

}
