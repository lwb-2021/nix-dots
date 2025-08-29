{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    (python3.withPackages (
      ps: with ps; [
        pandas
        matplotlib
        numpy
        ipython
        requests
        jupyter-kernel
      ]
    ))
  ];
  programs.uv = {
    enable = true;
    settings = {
      python-downloads = "never";
      pip.index-url = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/";
    };
  };
}
