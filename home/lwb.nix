{ config, pkgs, inputs,... }:{
  home.username = "lwb";
  home.homeDirectory = "/home/lwb";
  home.stateVersion = "25.05";
  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.dpi" = 153.6;
  };
  programs.git = {
    userName = "lwb";
    userEmail = "lwb-2021@qq.com";
  };
  imports = [
    ./config/fish-user.nix
    ./config/i18n.nix
    ./config/sops.nix
    ./config/thunar.nix


    ./programs/media/lyrics.nix
    ./programs/media/mpd.nix
    ./programs/media/mpris.nix
    ./programs/media/mpv.nix
    ./programs/media/ncmpcpp.nix


    ./programs/apps.nix

    ./programs/compatibility/wine.nix

    ./programs/daily/office.nix
    ./programs/daily/pandoc.nix
    ./programs/daily/ebook.nix

    ./programs/desktop
    ./programs/desktop/ags
    ./programs/desktop/hypr
    
    ./programs/desktop/apps/nomacs.nix
    ./programs/desktop/apps/copyq.nix


    ./programs/desktop/apps/launcher
    ./programs/desktop/apps/screenshot
    ./programs/desktop/apps/terminal

    ./programs/desktop/fonts.nix
    ./programs/desktop/rime.nix
    ./programs/desktop/themes.nix

    ./programs/development
    ./programs/development/code.nix
    ./programs/development/python.nix
    ./programs/development/git.nix

    ./programs/game/lutris.nix
    ./programs/game/minecraft.nix

    ./programs/network/aria2.nix
    ./programs/network/chat.nix
    ./programs/network/firefox.nix
    ./programs/network/kdeconnect.nix
    ./programs/network/syncthing.nix
    ./programs/network/thunderbird.nix

    
    ./programs/research/zotero.nix

    ./programs/security/keepassxc.nix
    ./programs/security/keyring.nix

    ./programs/shell/bat.nix
    ./programs/shell/eza.nix
    ./programs/shell/fastfetch.nix
    ./programs/shell/jq.nix
    ./programs/shell/navi.nix
    ./programs/shell/pay-respect.nix
    ./programs/shell/yazi.nix
    ./programs/shell/zellij.nix

    ./programs/study/anki.nix
  ];
  accounts.email.accounts."QQ" = {
    address = "lwb-2021@qq.com";
    userName = "lwb-2021@qq.com";
    realName = "lwb";
    primary = true;
    thunderbird.enable = true;
    imap = {
      host = "imap.qq.com";
      port = 993;
    };
  };
  programs.home-manager.enable = true;
}
