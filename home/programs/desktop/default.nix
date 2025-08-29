{
  pkgs,
  ...
}:
{
  imports = [
    ./xdg.nix
  ];
  home.packages = with pkgs; [
    xarchiver
  ];

}
