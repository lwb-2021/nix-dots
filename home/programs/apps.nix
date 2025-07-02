{ config, lib, pkgs, ... }: {
  home.packages = with pkgs;[
    qq
    wechat-uos
    wemeet


    calibre
    obsidian
  ];
}
