{ ... }: {
  programs.onagre = {
    enable = true;
  };
  wayland.launcher.exec = "onagre";
}
