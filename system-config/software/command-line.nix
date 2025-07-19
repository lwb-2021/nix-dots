{ config, lib, pkgs, ... }: {
  programs.fish = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    nix-output-monitor

    lolcat
    carbon-now-cli
    cowsay

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
    #toolong

    just

    p7zip-rar

    gemini-cli

    fishPlugins.fzf-fish
    fishPlugins.sponge

  ] ++ (if !pkgs.python3Packages.textual.meta.broken then [pkgs.toolong] else []);
  programs.fish = {
    interactiveShellInit = ''
            set fish_greeting
            fish_vi_key_bindings
    '';
  };

}
