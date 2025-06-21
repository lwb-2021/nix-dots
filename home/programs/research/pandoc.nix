{ config, lib, pkgs, ... }: {
  programs.pandoc = {
    enable = true;
    defaults = {
      metadata = {
        author = "lwb";
      };
      pdf-engine = "xelatex";
      citeproc = true;
      variables = {
        mainfont = "Source Han Sans SC";
      };

    };
  };

}
