{ config, lib, pkgs, ... }: {
  home.packages = with pkgs;[
    (python3.withPackages (ps: with ps; [
      pandas
      matplotlib
      numpy
      ipython
      requests
    ]))
    (buildFHSEnv {
      name = "conda-shell";
      targetPkgs = _: with pkgs;[ micromamba ]; 
      runScript = "env CONDA_SHELL=1 fish";
    })
  ];
  home.file.".condarc".text = ''
    channels: 
      - conda-forge
    show_channel_urls: true

    default_channels: 
      - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
      - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
      - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2

    custom_channels: 
      conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
      msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
      bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
      menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
      pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
      pytorch-lts: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
      simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
      deepmodeling: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/
  '';
  home.sessionVariables = {
    MAMBA_ROOT_PREFIX = "${config.home.homeDirectory}/.micromamba";
  };
  programs.fish = {
    shellAliases = {
      conda = "micromamba";
    };
    shellInit = ''
      if test $CONDA_SHELL
        micromamba shell hook -s fish --root-prefix ~/.micromamba |source
      end
    '';
  };
  programs.uv = {
    enable = true;
    settings = {
      python-downloads = "never";
      pip.index-url = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/";
    };
  };
}
