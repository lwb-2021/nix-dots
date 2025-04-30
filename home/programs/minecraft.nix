
let pkgs-flags = import <nixpkgs> {
    localSystem = {
        gcc.arch = "alderlake";
        gcc.tune = "alderlake";
        system = "x86_64-linux";
    };
};
in
{ config, pkgs, ... }: {
    home.packages = [(pkgs.prismlauncher.override {
            # Add binary required by some mod
            additionalPrograms = with pkgs;[ ffmpeg ];

            # Change Java runtimes available to Prism Launcher
            jdks = with pkgs-flags;[ jdk21 jdk17 jdk8 ];
        })
        pkgs.gamemode
    ];
}
