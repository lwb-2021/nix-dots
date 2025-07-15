{ config, lib, pkgs, ... }: {
  programs.fish = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    nix-output-monitor

    psmisc
    
    asciinema
    bat
    btop-cuda
    dust
    eza
    fastfetch
    fd
    fzf
    procs
    ripgrep
    tealdeer
    toolong

    just
    
    p7zip-rar

    gemini-cli

    fishPlugins.fzf-fish
    fishPlugins.sponge

  ];
  programs.fish = {
    interactiveShellInit = ''
            set fish_greeting
            fish_vi_key_bindings
            fastfetch
    '';
  };

}
