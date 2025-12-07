{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    source-han-sans
    nerd-fonts.jetbrains-mono
    nur.repos.rewine.ttf-wps-fonts
  ];

}
