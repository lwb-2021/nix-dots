{ config, pkgs, ... }: {
    home.packages = with pkgs;[(prismlauncher.override {
      # Add binary required by some mod
      additionalPrograms = [ ffmpeg ];
  
      # Change Java runtimes available to Prism Launcher
      jdks = [ pkgs.jdk21 pkgs.jdk17 pkgs.jdk8 ];
    })
      gamemode
    ];
}
