{ lib, pkgs, ... }:
{
  mkEmailAccount =
    name: account:
    account
    // {
      userName = lib.mkDefault account.address;
      imapnotify = {
        enable = lib.mkDefault true;
        onNotify = "${pkgs.isync}/bin/mbsync ${name}";
      };
      mbsync = {
        enable = lib.mkDefault true;
        create = "maildir";
      };
    };
}
