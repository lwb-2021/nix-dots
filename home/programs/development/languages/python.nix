{
  pkgs,
  ...
}:
{
  home.packages = [
    (import ./python-pkg.nix pkgs)
  ];
  programs.uv = {
    enable = true;
    settings = {
      python-downloads = "never";
      pip.index-url = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/";
    };
  };
}
