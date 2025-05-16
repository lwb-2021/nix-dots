{ config, lib, pkgs, ... }: {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "nvidia-x11"
        "nvidia-settings"
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
        "xow_dongle-firmware"

        "qq"
        "wechat-uos"

        "wemeet"
        "libwemeetwrap"

        "obsidian"
    ];

}
