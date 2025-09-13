{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    zellij
  ];
  programs.fish.shellInitLast = # fish
    ''
      if status is-interactive
          if test "$TERM_PROGRAM" != "vscode" && test "$TERMINAL_EMULATOR" != "JetBrains-JediTerm"
              and not set -q ZELLIJ

              zellij attach -c default
          else
              fastfetch | lolcat
          end
      end

    '';
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;

}
