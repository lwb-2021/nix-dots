{ config, lib, pkgs, ... }: {
    home.packages = with pkgs;[
        qq
        wechat-uos
        
        obsidian
    ];
}
