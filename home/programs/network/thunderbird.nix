{ pkgs, ... }:
{
  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
      extensions = [ ];
    };
  };
  home.packages = with pkgs; [
    birdtray
  ];
  xdg.autostart.entries = [
    "${pkgs.birdtray}/share/applications/com.ulduzsoft.Birdtray.desktop"
  ];

}
