{ pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
        no_fade_in = false;
      };

      input-field = {
        size = "800, 100";
        position = "0, -320";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        outline_thickness = 5;
        placeholder_text = "<span foreground=\"##a9a9a9\">Password</span>";
        shadow_passes = 2;
      };
    };
  };
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
      };
      # listener = [
      #   {
      #     timeout = 300;
      #     on-timeout = "loginctl lock-session";
      #   }
      #   {
      #     timeout = 600;
      #     on-timeout = "systemctl suspend";
      #   }
      # ];
    };
  };
}
