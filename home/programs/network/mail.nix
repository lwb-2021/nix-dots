{ pkgs, ... }:
{
  programs.mbsync = {
    enable = true;
  };
  services.imapnotify = {
    enable = true;
    package = pkgs.goimapnotify;
  };
  programs.neomutt = {
    enable = true;
  };
  accounts.email.maildirBasePath = "Mail";
  data.directories = [
    "Mail"
  ];
}
