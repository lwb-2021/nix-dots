{
  pkgs,
  ...
}:
{
  imports = [
    ./xdg.nix
    ./vars.nix
  ];
  home.packages = with pkgs; [
    xarchiver
  ];

}
