{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (jetbrains.idea-ultimate.override {
      forceWayland = true;
    })
  ];
}
