{
  pkgs,
  ...
}:
let
  plug = name: {
    inherit name;
    src = pkgs.fishPlugins.${name}.src;
  };
in
{

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings
    '';

    shellInit = ''
      test ! -e "$HOME/.x-cmd.root/local/data/fish/rc.fish" || source "$HOME/.x-cmd.root/local/data/fish/rc.fish"
    '';
    shellAliases = {
    };
    shellAbbrs = {
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
    plugins = [
      (plug "fzf-fish")
      (plug "sponge")
    ];
  };
  programs.bash = {
    enable = true;
  };
  data = {
    local.directories = [ ".cache/fish" ];
  };
}
