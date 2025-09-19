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
            (sloth.mkdir (sloth.concat' sloth.xdgDocumentsDir "/DingTalk/DingTalkConfig"))
            (sloth.concat' sloth.xdgConfigHome "/DingTalk")
          ]
          [
            (sloth.mkdir (sloth.concat' sloth.xdgDocumentsDir "/DingTalk/UTStorage"))
            (sloth.concat' sloth.homeDir "/.ut_storage")
          ]
          (sloth.mkdir (sloth.concat' sloth.homeDir "/Downloads/DingTalk"))

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
        };
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
