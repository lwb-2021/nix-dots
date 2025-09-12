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
      flatpak = rec {
        appId = "com.alibabainc.dingtalk";
        desktopFile = pkgs.makeDesktopItem {
          name = appId;
          desktopName = "Dingtalk";
          genericName = "dingtalk";
          categories = [ "Chat" ];
          exec = "dingtalk %u";
          icon = "dingtalk";
          keywords = [ "dingtalk" ];
          mimeTypes = [ "x-scheme-handler/dingtalk" ];
          extraConfig = {
            "Name[zh_CN]" = "钉钉";
            "Name[zh_TW]" = "釘釘";
          };
        };
      };
      dbus.policies = {
        "org.gnome.Shell.Screencast" = "talk";
        "org.freedesktop.Notifications" = "talk";
        "org.kde.StatusNotifierWatcher" = "talk";
      };
      bubblewrap = {
        bind.rw = [
          # (sloth.mkdir (
          # sloth.concat [
          # sloth.homeDir
          # "/xwechat_files"
          # ]
          # ))
        ];
        bind.ro = [
          "/etc/passwd"
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
          # IBUS_USE_PORTAL = "1";
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
}).config.script
