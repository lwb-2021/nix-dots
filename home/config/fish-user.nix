{
  config,
  lib,
  pkgs,
  ...
}:
{

  programs.starship = {
    enable = true;
  };
  programs.fish = {
    enable = true;

    shellInit = ''
      test ! -e "$HOME/.x-cmd.root/local/data/fish/rc.fish" || source "$HOME/.x-cmd.root/local/data/fish/rc.fish"
    '';
    shellAliases = {
      ls = "eza --icons=auto";
    };
    functions = {
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
      retry = ''
        while true
            $argv
            if test $status -eq 0
                break
            end
        end
      '';
    };
  };
  programs.bash = {
    enable = true;
  };
  programs.bash = {
    bashrcExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
  catppuccin.fish.enable = false;
}
