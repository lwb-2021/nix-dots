{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    (lutris.override {
      extraLibraries =
        pkgs: with pkgs; [
        ];
    })
  ];

}
