{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixos-artwork.wallpapers.catppuccin-mocha
  ];
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
        no_fade_in = false;
      };

      background = [
        {
          path = "${pkgs.nixos-artwork.wallpapers.catppuccin-mocha}/share/backgrounds/nixos/nixos-wallpaper-catppuccin-mocha.png";
        }
      ];

      input-field = [
        {
          size = "800, 100";
          position = "0, -320";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "<span foreground=\"##a9a9a9\">Password</span>";
          shadow_passes = 2;
        }
      ];
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
