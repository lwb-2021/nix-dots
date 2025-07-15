{ config, lib, pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
    settings = {
      theme = "tokyo-night-dark";
      show_startup_tips = false;    
      default_mode = "locked";
    };
  };
  programs.fish.shellInitLast = /* fish */ ''
if status is-interactive
    and test "$TERM_PROGRAM" != "vscode"
    and not set -q ZELLIJ

    zellij attach -c default
end

  '';

}
