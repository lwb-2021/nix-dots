{ lib, pkgs, inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: { 
      graphite-gtk-theme = prev.callPackage (builtins.fetchurl {
          url = "https://ghproxy.cn/https://github.com/NixOS/nixpkgs/raw/refs/heads/master/pkgs/by-name/gr/graphite-gtk-theme/package.nix";
          sha256 = "sha256:14k7090ksn5cx52fi3pxdm30jl51fihkjryf4ihhmbbqj4xa1b3l";
      }) {};    
      ncmpcpp = prev.callPackage (builtins.fetchurl{
        url = "https://ghproxy.cn/https://github.com/NixOS/nixpkgs/raw/refs/heads/master/pkgs/by-name/nc/ncmpcpp/package.nix";
        sha256 = "sha256:1cyn3alsda4kbr972fc317fyqnf1l5yii7nnbh48xr5bfn8zd9m8";
      }) {};
    })
  ];
}
