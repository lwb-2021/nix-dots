{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
  };
  home.packages = with pkgs; [
    commitizen-go
    commitlint-rs
    husky
  ];
}
