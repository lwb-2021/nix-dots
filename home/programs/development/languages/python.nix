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
        requests

        tabulate

        ipython
        ipykernel
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
