{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (prismlauncher.override {
      # Add binary required by some mod
      additionalPrograms = [
        ffmpeg
        glfw3
      ];

      # Change Java runtimes available to Prism Launcher
      jdks = [
        jdk21
        jdk17
        jre8
      ];
    })
    gamemode
  ];
}
