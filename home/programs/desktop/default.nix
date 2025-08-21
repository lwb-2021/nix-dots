{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./xdg.nix
    ./notification/mako.nix
  ];
  home.packages = with pkgs; [
    xarchiver
  ];

}
