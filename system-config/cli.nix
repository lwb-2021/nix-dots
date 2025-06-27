{ config, lib, pkgs, ... }: {
  programs.fish = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    psmisc

    bat
    eza
    fastfetch
    fzf

    p7zip-rar

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
