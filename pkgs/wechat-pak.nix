{ lib, mkNixPak, pkgs, ... }: (mkNixPak { config = { sloth, ... }: {
  flatpak = {
    appId = "com.tencent.wechat";
  };
  dbus = {
    enable = true;
    policies = {
      "org.gnome.Shell.Screencast" = "talk";
      "org.freedesktop.Notifications" = "talk";
      "org.kde.StatusNotifierWatcher" = "talk";

      "org.freedesktop.portal.Documents" = "talk";
      "org.freedesktop.portal.Flatpak" = "talk";
      "org.freedesktop.portal.FileChooser" = "talk";
    };
  };
  bubblewrap = {
    bind.rw = [
      (sloth.mkdir (sloth.concat [ sloth.xdgDocumentsDir "/WeChat" ]))
    ];
    bind.ro = [
      "/etc/passwd"
    ];
    
    sockets = {
      x11 = true;
      wayland = true;
      pipewire = true;
    };
    bind.dev = [
      "/dev/shm"
      "/dev/video0"
      "/dev/video1"
    ];
    env = {
      IBUS_USE_PORTAL = "1";
    };
  };
  app = {
    package = pkgs.wechat;
  };
  imports = [ 
    ./base/nix-pak-gui.nix 
    ./base/nix-pak-network.nix
  ];
};
}).config.script
