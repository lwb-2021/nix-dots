{ config, lib, pkgs, ... }: {
    home.packages = with pkgs;[
        python3
    ];
    programs.uv = {
        enable = true;
        settings = {
            python-downloads = "never";
            pip.index-url = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/";
        };
    };
}
