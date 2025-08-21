{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
  };
  environment.systemPackages =
    with pkgs;
    [
      nix-output-monitor

      lolcat
      carbon-now-cli
      cowsay

      nettools
      psmisc
      jq

      asciinema
      bat
      btop-cuda
      cyme
      dust
      eza
      fastfetch
      fd
      fzf
      glow
      procs
      ripgrep
      tealdeer
      #toolong

      just

      ffmpeg-full
      p7zip-rar

      gemini-cli

      fishPlugins.fzf-fish
      fishPlugins.sponge

    ]
    ++ (if !pkgs.python3Packages.textual.meta.broken then [ pkgs.toolong ] else [ ]);
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
    '';
  };

  programs.nh = {
    enable = true;
    flake = "/home/lwb/NixOS-Configuration";
  };
}
