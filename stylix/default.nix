{ pkgs, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16Scheme}/share/themes/catppuccin-mocha.yaml";
    override = {

    };
    fonts = rec {
      sansSerif = pkgs.source-han-sans;
      monospace = pkgs.nerd-fonts.jetbrains-mono;
      emoji = pkgs.noto-fonts-color-emoji;
      serif = sansSerif;
    };
  };
}
