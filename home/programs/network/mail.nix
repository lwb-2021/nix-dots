{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.imapnotify = {
    enable = true;
    package = pkgs.goimapnotify;
  };
  data.directories = [
    ".mail"
  ];
}
