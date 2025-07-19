{ lib, pkgs, inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: { 
      graphite-gtk-theme = prev.callPackage (builtins.fetchurl 
        {
          url = "https://ghproxy.cn/raw.githubusercontent.com/romildo/nixpkgs/7875cddddd88c696039bf94b7c1e398a471f8d14/pkgs/by-name/gr/graphite-gtk-theme/package.nix";
          sha256 = "sha256:14k7090ksn5cx52fi3pxdm30jl51fihkjryf4ihhmbbqj4xa1b3l";
        }
      ) {};    
    })
  ];
}
