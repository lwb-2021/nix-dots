{ ... }:
{
  services.vicinae = {
    enable = true;
    autoStart = true;
  };
  wayland.launcher.exec = "vicinae toggle";
}
