{ ... }:
{
  services.vicinae = {
    enable = true;
    autoStart = true;
    settings = {
      theme.name = "vicinae-dark";
      window = {
        csd = true;
        opacity = 0.9;
        rounding = 10;
      };

      faviconService = "twenty";
    };
  };
  wayland.launcher.exec = "vicinae toggle";
}
