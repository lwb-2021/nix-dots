{ ... }:
{
  programs.fastfetch = {
    enable = true;
  };
  programs.fish.shellInitLast = ''
    fastfetch
  '';
}
