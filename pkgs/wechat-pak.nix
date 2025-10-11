{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  mkNixPak = inputs.nixpak.lib.nixpak {
    inherit lib pkgs;
  };
in
(mkNixPak {
  config =
    { sloth, ... }:
    {
      flatpak = {
        appId = "com.tencent.wechat";
      };
      dbus.policies = {
        "org.gnome.Shell.Screencast" = "talk";
        "org.freedesktop.Notifications" = "talk";
        "org.kde.StatusNotifierWatcher" = "talk";
      };
      bubblewrap = {
        bind.rw = [
          [
            (sloth.mkdir (sloth.concat' sloth.xdgDocumentsDir "/WeChat"))
            (sloth.concat' sloth.homeDir "/xwechat_files")
          ]
        ];
        bind.ro = [
          "/etc/passwd"
          "/etc/machine-id"
        ];

        sockets = {
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
