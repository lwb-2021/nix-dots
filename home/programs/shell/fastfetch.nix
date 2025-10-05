{ ... }:
{
  programs.fastfetch = {
    enable = true;
    package = null;
  };
  programs.fish.shellInitLast = ''
    fastfetch | lolcat
  '';
}
