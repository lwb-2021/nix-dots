{
  config,
  lib,
  pkgs,
  ...
}:
{

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
  data.files = [
  ];
}
