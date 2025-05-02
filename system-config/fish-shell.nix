{ config, lib, pkgs, ...}:{
  environment.systemPackages = with pkgs; [
    bat
    eza
    fastfetch
    fzf

    fishPlugins.fzf-fish

  ];
  programs.starship = {
    enable = true;
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
      fastfetch
    '';
  };
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

}
