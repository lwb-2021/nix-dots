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
        appId = "com.alibabainc.dingtalk";
      };
      dbus.policies = {
        "org.gnome.Shell.Screencast" = "talk";
        "org.freedesktop.Notifications" = "talk";
        "org.kde.StatusNotifierWatcher" = "talk";
      };
      bubblewrap = {
        bind.rw = [
          [
            (sloth.mkdir (sloth.concat' sloth.xdgDocumentsDir "/DingTalk/dot-config"))
            sloth.xdgConfigHome
          ]
          [
            (sloth.mkdir (sloth.concat' sloth.xdgDocumentsDir "/DingTalk/dot-ut_storage"))
            (sloth.concat' sloth.homeDir "/.ut_storage")
          ]
          [
            (sloth.mkdir (sloth.concat' sloth.xdgDownloadDir "/Downloads/DingTalk"))
            sloth.xdgDownloadDir
          ]

        ];

        bind.ro = [
          "/run/current-system/sw/bin/cat"
          "/bin/sh"
          "/etc/os-release"
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
      };
      app = {
        package = pkgs.nur.repos.xddxdd.dingtalk;
      };
      imports = [
        ./base/nix-pak-gui.nix
        ./base/nix-pak-network.nix
      ];
    };
}).config.env
