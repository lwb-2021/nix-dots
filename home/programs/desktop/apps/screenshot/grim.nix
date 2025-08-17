{ pkgs, ... }: {
  home.packages = with pkgs;[
    slurp
    grim
  ];
  wayland.screenshot.exec = "";
}
