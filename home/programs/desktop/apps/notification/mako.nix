{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      sort = "-time";
      layer = "overlay";
      border-radius = 12;
      icons = 1;
      max-icon-size = 64;
      default-timeout = 5000;
      ignore-timeout = 0;
      font = "\"Source Han Sans CN\" 12";
    };
  };
  home.packages = with pkgs; [
    libnotify
  ];

}
