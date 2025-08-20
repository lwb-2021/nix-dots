{ config, pkgs, pkgs-native, ... }: {
    home.packages = with pkgs;[(prismlauncher.override {
      # Add binary required by some mod
      additionalPrograms = [ ffmpeg ];
  
      # Change Java runtimes available to Prism Launcher
      jdks = [ pkgs-native.jre21_minimal pkgs.jre17_minimal pkgs-native.jre8 ];
    })
      gamemode
    ];
}
