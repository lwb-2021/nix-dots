{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (jetbrains.idea.override {
      forceWayland = true;
    })
  ];
}
