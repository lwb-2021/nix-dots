{ config, lib, pkgs, ... }: {
    programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ]; # fix fcitx5
}
