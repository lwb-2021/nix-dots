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
        appId = "com.tencent.qq";
      };
      dbus.policies = {
        "org.gnome.Shell.Screencast" = "talk";
        "org.freedesktop.Notifications" = "talk";
        "org.kde.StatusNotifierWatcher" = "talk";
      };
      bubblewrap = {
        bind.rw = [
          [
            (sloth.mkdir (sloth.concat' sloth.xdgDocumentsDir "/QQ"))
            (sloth.concat' sloth.xdgConfigHome "/QQ")
          ]
          (sloth.mkdir (sloth.concat' sloth.xdgDownloadDir "/QQ"))
        ];
        
        bind.ro = [
          "/etc/machine-id"
        ];

        sockets = {
          wayland = true;
          pipewire = true;
        };
        bind.dev = [
          "/dev/shm"
        ];
      };
      app = {
        package = pkgs.qq;
      };
      imports = [
        ./base/nix-pak-gui.nix
        ./base/nix-pak-network.nix
      ];
    };
}).config.script
