{ pkgs, ... }:
{
  programs.mbsync = {
    enable = true;
  };
  services.imapnotify = {
    enable = true;
    package = pkgs.goimapnotify;
  };
  accounts.email.maildirBasePath = "Mail";
  data.directories = [
    "Mail"
  ];
}
