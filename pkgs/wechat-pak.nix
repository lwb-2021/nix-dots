{ lib, mkNixPak, ... }: (mkNixPak { config = { pkgs, sloth, ... }: {
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
      "/etc/ssl/certs/ca-bundle.crt"
      "/etc/ssl/certs/ca-certificates.crt"
      "/etc/pki/tls/certs/ca-bundle.crt"
    ];
    network = true;
    sockets = {
      #x11 = true;
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
  imports = [ ./base/nix-pak-gui.nix ];
};
}).config.script
