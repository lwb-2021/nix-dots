{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (prismlauncher.override {
      # Add binary required by some mod
      additionalPrograms = [ ffmpeg ];

      # Change Java runtimes available to Prism Launcher
      jdks = [
        jre21_minimal
        jre17_minimal
        jre8
      ];
    })
    gamemode
  ];
}
