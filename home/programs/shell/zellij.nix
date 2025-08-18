{ config, lib, pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
    settings = {
      show_startup_tips = false;
      default_mode = "locked";
    };
  };
  programs.fish.shellInitLast = /* fish */ ''
if status is-interactive
    if test "$TERM_PROGRAM" != "vscode"
        and not set -q ZELLIJ

        zellij attach -c default
    else
        fastfetch | lolcat
    end
end

  '';

}
