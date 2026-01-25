{ lib, pkgs, ... }:
{
  mkEmailAccount =
    name: account:
    account
    // {
      userName = lib.mkDefault account.address;
      imapnotify = {
        enable = lib.mkDefault true;
        onNotify = "mbsync ${name}";
        boxes = [ "INBOX" ];
      };
      mbsync = {
        enable = lib.mkDefault true;
        create = "maildir";
      };
      neomutt = {
        enable = true;
        mailboxType = "maildir";
      };
    };
}
