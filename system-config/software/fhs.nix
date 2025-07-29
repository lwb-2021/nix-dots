{ pkgs, ... }: {
  environment.systemPackages = with pkgs;[
    (buildFHSEnv {
      name = "fhs";
      targetPkgs = pkgs: (with pkgs;[
        stdenv.cc
        
        wayland
        glib
        libGL
        fontconfig

        udev
        fuse
        libusb1

        zstd
      ]);
    })  
  ];
}
