{ pkgs, ... }:
{
  programs.mbsync = {
    enable = true;
  };
  services.imapnotify = {
    enable = true;
    package = pkgs.goimapnotify;
  };
  data.directories = [
    ".mail"
  ];
}
