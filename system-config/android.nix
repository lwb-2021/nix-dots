{ config, lib, pkgs, ... }: {
    programs.adb.enable = true;
    users.users.lwb.extraGroups = [ "adbusers" ];
    virtualisation.waydroid.enable = true;
}
