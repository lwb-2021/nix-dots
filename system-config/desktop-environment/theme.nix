{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    phinger-cursors
    beauty-line-icon-theme
    (catppuccin-gtk.override {
      accents = [ "mauve" ];
      size = "compact";
      tweaks = [ "black" ];
      variant = "mocha";
    })
  ];
  catppuccin = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
  };

}
