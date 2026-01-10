{ ... }:
{
  programs.ripgrep = {
    enable = true;
    package = null;
    arguments = [
      ""
    ];
  };
  programs.ripgrep-all = {
    enable = true;
  };
}
