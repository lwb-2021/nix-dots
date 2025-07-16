{ lib, pkgs, mkNixPak, ... }: (mkNixPak { config = { sloth, ... }: {
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
      "/etc/fonts"
      "/etc/machine-id"
      "/etc/localtime"
      "/etc/passwd"
      "/etc/ssl/certs/ca-bundle.crt"
      "/etc/ssl/certs/ca-certificates.crt"
      "/etc/pki/tls/certs/ca-bundle.crt"
    ];
    network = true;
    sockets = {
      x11 = true;
      wayland = true;
      pipewire = true;
    };
    bind.dev = [
      "/dev/dri"
      "/dev/shm"
      "/dev/video0"
      "/dev/video1"
    ];
    tmpfs = [
      "/tmp"
    ];
    env = {
      IBUS_USE_PORTAL = "1";
      XDG_DATA_DIRS = lib.mkForce (lib.makeSearchPath "share" (with pkgs; [

        phinger-cursors
        beauty-line-icon-theme
        (graphite-gtk-theme.override {
          themeVariants = [ "purple" ];
          sizeVariants = [ "compact" ];
          tweaks = [ "black" ];
          wallpapers = true;
          withGrub = true;
        })

        shared-mime-info
      ]));
      XCURSOR_PATH = lib.mkForce (lib.concatStringsSep ":" (with pkgs; [
        "${phinger-cursors}/share/icons"
        "${phinger-cursors}/share/pixmaps"
        "${beauty-line-icon-theme}/share/icons"
        "${beauty-line-icon-theme}/share/pixmaps"
      ]));
    };
  };
  app = {
    package = pkgs.wechat;
  };
};
}).config.script
